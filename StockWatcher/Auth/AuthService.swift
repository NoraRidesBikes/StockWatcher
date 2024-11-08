//
//  AuthService.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import Foundation
import KeychainSwift

@Observable
final class AuthService: ObservableObject {

    enum Keys: String {
        case sessionToken
        case sessionExpirationToken
    }
    
    struct AuthTokens {
        var sessionToken: String?
        var sessionExpirationToken: String?
    }
    
    static let shared = AuthService()
    
    private let keychain = KeychainSwift()
    
    var unauthorized: Bool = true

    private init() {
        let authTokens = getAuthTokens()
        unauthorized = (authTokens.sessionToken == nil || authTokens.sessionExpirationToken == nil)
    }
    
    func getAuthTokens() -> AuthTokens {
        return AuthTokens(sessionToken: keychain.get(Keys.sessionToken.rawValue), sessionExpirationToken: keychain.get(Keys.sessionExpirationToken.rawValue))
    }
      
    func setAuthTokens(sessionToken: String, sessionExpirationToken: String) {
        keychain.set(sessionToken, forKey: Keys.sessionToken.rawValue)
        keychain.set(sessionExpirationToken, forKey: Keys.sessionExpirationToken.rawValue)
        unauthorized = false
    }
    
    func deauthorize() {
        keychain.delete(Keys.sessionToken.rawValue)
        keychain.delete(Keys.sessionExpirationToken.rawValue)
        unauthorized = true
    }
}
