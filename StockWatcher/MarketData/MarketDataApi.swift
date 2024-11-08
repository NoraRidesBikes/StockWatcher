//
//  MarketDataAPI.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import Foundation

final class MarketDataAPI {
    
    static let shared = MarketDataAPI()
    
    private init() { }
    
    func get(request: MarketDataRequest) async throws -> MarketDataResponse {
        let resource = try ApiResource(path: .marketData, method: .get, pathAppending: request.symbolName)
        let response: MarketDataResponse = try await Api.shared.request(resource: resource)
        return response
    }
}
