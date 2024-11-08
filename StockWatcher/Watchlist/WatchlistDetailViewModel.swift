//
//  WatchlistDetailViewModel.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import SwiftUI
import Foundation

@Observable
class WatchlistDetailViewModel: ObservableObject {
    
    var hasError: Bool = false
    var error: Error? = nil
    var watchlist: Watchlist
    var lastUpdated: String = ""
    ///
    /// Requirement is very five seconds....
    ///
    var refreshSeconds = 5

    init(watchlist: Watchlist) {
        self.watchlist = watchlist
    }
    ///
    /// Refresh the data for the given watchlist
    ///
    func fetchWatchlist() async {
        do {
            let watchlistRequest = WatchlistRequest(name: watchlist.name)
            let response = try await WatchlistApi.shared.get(request: watchlistRequest)
            watchlist = response.watchlist
            lastUpdated = "\(Date.now.formatted(date: .complete, time: .complete))"
        } catch {
            print(error)
            self.error = error
            self.hasError = true
        }
    }
    ///
    /// Remove a symbol to the watchlist
    ///
    func removeStockSymbol(at offsets: IndexSet) async {
        do {
            var entries = watchlist.entries
            entries.remove(atOffsets: offsets)
            
            let request = WatchlistRequest(name: watchlist.name, orderIndex: watchlist.orderIndex, watchlistEntries: entries)
            try await WatchlistApi.shared.update(request: request)
            await fetchWatchlist()
        } catch {
            self.error = error
            self.hasError = true
        }
    }
}
