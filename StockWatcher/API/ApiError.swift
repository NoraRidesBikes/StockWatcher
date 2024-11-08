//
//  APIError.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import SwiftUI
import Foundation

enum ApiError: Error {
    case invalidRequest
    case invalidResourcePath
}

extension ApiError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return String(LocalizedStringKey.ApiKeys.invalidApiRequest)
        case .invalidResourcePath:
            return String(LocalizedStringKey.ApiKeys.invalidResourcePath)
        }
    }

    public var recoverySuggestion: String? {
        switch self {
        case .invalidRequest:
            return String(LocalizedStringKey.ApiKeys.apiRetry)
        case .invalidResourcePath:
            return String(LocalizedStringKey.ApiKeys.apiRetry)
        }
    }
}
