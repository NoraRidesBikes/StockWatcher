//
//  SearchSymbolsViewModel.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import SwiftUI
import Foundation

@Observable
class SearchSymbolsViewModel: ObservableObject {
    
    var stockSymbols = [StockSymbol]()
    var hasError: Bool = false
    var error: Error? = nil
    
    var errorKey: String {
        if let err = error as? LocalizedError, let message = err.recoverySuggestion {
            return message
        }
        return String(LocalizedStringKey.GenericKeys.errorMessage)
    }
    ///
    /// Search the stock symbol API based on text input from the user
    ///
    func search(searchString: String) async {
        do {
            let request = SymbolSearchRequest(searchString: searchString)
            let response = try await SymbolSearchApi.shared.search(request: request)
            stockSymbols = response.items
        } catch {
            self.error = error
            self.hasError = true
        }
    }
    ///
    /// Add a new symbol to the watchlist
    ///
    func addStockSymbol(stockSymbol: StockSymbol, to watchlist: Watchlist) async {
        do {

            var entries = watchlist.entries
            ///
            /// Only add if the symbol does not aleady exist
            ///
            if entries.contains(where: {$0.symbol == stockSymbol.symbol}) {
                return
            }
            
            entries.append(stockSymbol)
            
            let request = WatchlistRequest(name: watchlist.name, orderIndex: watchlist.orderIndex, watchlistEntries: entries)
            
            try await WatchlistApi.shared.update(request: request)
            
        } catch {
            self.error = error
            self.hasError = true
        }
    }
}
