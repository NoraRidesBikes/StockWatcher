//
//  SymbolSearchApi.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import Foundation

final class SymbolSearchApi {
    
    private let host = "vast.tastyworks.com"
    
    static let shared = SymbolSearchApi()
    
    private init() { }
    ///
    /// Searches the stock symbol endpoint 
    ///
    func search(request: SymbolSearchRequest) async throws -> SymbolSearchResponse {
        let resource = try ApiResource(host: host, path: .searchSymbols, method: .get, pathAppending: request.searchString)
        let response: SymbolSearchResponse = try await Api.shared.request(resource: resource)
        return response
    }
}
