//
//  LoginViewModel.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/5/24.
//
import SwiftUI
import Foundation

@Observable
class LoginViewModel: ObservableObject {
    
    var username: String = ""
    var password: String = ""
    var hasError: Bool = false
    var error: Error? = nil
    
    var errorKey: String {
        if let err = error as? LocalizedError, let message = err.recoverySuggestion {
            return message
        }
        return String(LocalizedStringKey.GenericKeys.errorMessage)
    }
    
    func login() async {
        do {
            let request = LoginRequest(username: username, password: password)
            let response = try await LoginApi.shared.login(request: request)
            AuthService.shared.setAuthTokens(sessionToken: response.sessionToken, sessionExpirationToken: response.sessionExpiration)
        } catch {
            self.error = error
            self.hasError = true
        }
    }
    
    func reset() {
        hasError = false
        error = nil
    }
}
