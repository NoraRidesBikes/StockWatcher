//
//  API.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import Foundation

struct ApiResource {

    private let scheme = "https"
    private let baseUrl = "api.cert.tastyworks.com"
    private let accept = "Accept"
    private let contentType = "Content-Type"
    private let authorization = "Authorization"
    private let applictaionJson = "application/json"
    
    enum Method: String {
        case get
        case post
        case delete
        case put
    }
    
    enum ResourcePath: String {
        case login = "/sessions"
        case watchlists = "/watchlists"
        case searchSymbols = "/symbols/search"
        case marketData = "/market-data"
    }
    
    let path: ResourcePath
    let method: Method
    var urlRequest: URLRequest
    
    init(host: String? = nil, path: ResourcePath, method: Method, body: Encodable? = nil, pathAppending: String? = nil) throws {
        
        self.path = path
        self.method = method
        
        var components = URLComponents()
        
        if let host = host {
            components.host = host
        } else {
            components.host = baseUrl
        }
        
        components.scheme = scheme
        components.path = path.rawValue
        
        guard var url = components.url else {
            throw ApiError.invalidResourcePath
        }

        if let pathAppending = pathAppending {
            url = url.appending(path: "/\(pathAppending)")
        }
    
        self.urlRequest = URLRequest(url: url)
        self.urlRequest.httpMethod = method.rawValue.uppercased()
        self.urlRequest.setValue(applictaionJson, forHTTPHeaderField: accept)
        self.urlRequest.setValue(applictaionJson, forHTTPHeaderField: contentType)
        self.urlRequest.setValue(AuthService.shared.getAuthTokens().sessionToken, forHTTPHeaderField: authorization)
        
        if let jsonBody = body {
            self.urlRequest.httpBody = try! JSONEncoder().encode(jsonBody)
        }
    }
}

struct Api {
    
    static let shared = Api()
    
    private init() { }
    ///
    /// Sends an API call that expects a decoded response
    ///
    func request<D: Decodable>(resource: ApiResource) async throws -> D {
        
        let (data, response) = try await URLSession.shared.data(for: resource.urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidRequest
        }
        ///
        /// The login request returns a decodable response but also creates a resource.
        ///
        if httpResponse.statusCode != 200 && httpResponse.statusCode != 201 {
            throw ApiError.invalidRequest
        }
        
        return try JSONDecoder().decode(D.self, from: data)
    }
    ///
    /// Sends an API call that does **not** expect a decoded response
    ///
    func send(resource: ApiResource) async throws {
        
        let (_, response) = try await URLSession.shared.data(for: resource.urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidRequest
        }
        
        if httpResponse.statusCode != 200 && httpResponse.statusCode != 201 {
            throw ApiError.invalidRequest
        }
    }
}
