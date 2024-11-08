//
//  WatchlistApi.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import Foundation

final class WatchlistApi {
    
    static let shared = WatchlistApi()
    
    private init() { }
    ///
    /// Creates a new watchlist via the API
    ///
    func create(request: CreateWatchlistRequest) async throws  {
        let resource = try ApiResource(path: .watchlists, method: .post, body: request)
        try await Api.shared.send(resource: resource)
    }
    ///
    /// Fetches the waitchlists for the user that is currently authenticated
    ///
    func get() async throws -> WatchlistsResponse {
        let resource = try ApiResource(path: .watchlists, method: .get)
        let response: WatchlistsResponse = try await Api.shared.request(resource: resource)
        return response
    }
    ///
    /// Deletes an existint watchlist via the API
    ///
    func delete(request: DeleteWatchlistRequest) async throws  {
        let resource = try ApiResource(path: .watchlists, method: .delete, pathAppending: request.name)
        try await Api.shared.send(resource: resource)
    }
    ///
    /// Updates a watchlist
    ///
    func update(request: WatchlistRequest) async throws  {
        let resource = try ApiResource(path: .watchlists, method: .put, body: request, pathAppending: request.name)
        try await Api.shared.send(resource: resource)
    }
    ///
    /// Gets a specific watchlist for the authenticated user
    ///
    func get(request: WatchlistRequest) async throws -> WatchlistResponse {
        
        let resource = try ApiResource(path: .watchlists, method: .get, pathAppending: request.name)
        var response: WatchlistResponse = try await Api.shared.request(resource: resource)

        try await withThrowingTaskGroup(of: MarketData.self) { group in
            
            for stockSymbol in response.watchlist.entries {
                let marketRequest = MarketDataRequest(symbolName: stockSymbol.symbol)
                group.addTask {
                    return try await MarketDataAPI.shared.get(request: marketRequest).marketData
                }
            }
            
            for try await marketData in group {
                if let index = response.watchlist.entries.firstIndex(where: {$0.symbol == marketData.symbol}) {
                    response.watchlist.entries[index].marketData = marketData
                }
            }
        }

        return response
    }
}
