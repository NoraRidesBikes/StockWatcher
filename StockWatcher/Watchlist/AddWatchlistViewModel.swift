//
//  AddWatchlistViewModel.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import SwiftUI
import Foundation

@Observable
class AddWatchlistViewModel: ObservableObject {
    var watchlistName: String = ""
    var hasError: Bool = false
    var error: Error? = nil
    
    var errorKey: String {
        if let err = error as? LocalizedError, let message = err.recoverySuggestion {
            return message
        }
        return String(LocalizedStringKey.GenericKeys.errorMessage)
    }
    
    func addWatchlist(at index: Int) async {
        do {
            let request = CreateWatchlistRequest(name: watchlistName, orderIndex: index)
            try await WatchlistApi.shared.create(request: request)
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
