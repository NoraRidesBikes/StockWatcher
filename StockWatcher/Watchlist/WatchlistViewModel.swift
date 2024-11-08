//
//  WatchlistViewModel.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import SwiftUI
import Foundation

@Observable
class WatchlistViewModel: ObservableObject {
    
    var watchlists = [Watchlist]()
    var hasError: Bool = false
    var error: Error? = nil
    
    var errorKey: String {
        if let err = error as? LocalizedError, let message = err.recoverySuggestion {
            return message
        }
        return String(LocalizedStringKey.GenericKeys.errorMessage)
    }
    
    func fetchWatchlists() async {
        do {
            watchlists = try await WatchlistApi.shared.get().watchlists.sorted {
                $0.orderIndex < $1.orderIndex
            }
        } catch {
            self.error = error
            self.hasError = true
        }
    }
    
    func deleteWatchlist(atOffsets: IndexSet) async {
        do {
            guard let watchlist = atOffsets.map({ self.watchlists[$0] }).first else {
                return
            }
            let request = DeleteWatchlistRequest(name: watchlist.name)
            try await WatchlistApi.shared.delete(request: request)
            await fetchWatchlists()
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
