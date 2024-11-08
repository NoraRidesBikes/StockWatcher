//
//  LoginApi.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/4/24.
//
import Foundation

final class LoginApi {
    
    static let shared = LoginApi()
    
    private init() { }
    ///
    /// 
    ///
    func login(request: LoginRequest) async throws -> LoginResponse {
        let resource = try ApiResource(path: .login, method: .post, body: request)
        let response: LoginResponse = try await Api.shared.request(resource: resource)
        return response
    }
}
