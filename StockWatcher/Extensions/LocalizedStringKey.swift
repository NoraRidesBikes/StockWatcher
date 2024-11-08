//
//  String.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import SwiftUI
import Foundation

extension LocalizedStringKey {
    ///
    /// Generic
    ///
    static let submit = LocalizedStringKey(GenericKeys.submit)
    static let cancel = LocalizedStringKey(GenericKeys.cancel)
    static let alertTitle = LocalizedStringKey(GenericKeys.alertTitle)
    static let ok = LocalizedStringKey(GenericKeys.ok)
    static let errorMessage = LocalizedStringKey(GenericKeys.errorMessage)
    static let signOutMessage = LocalizedStringKey(GenericKeys.signOutMessage)
    static let search = LocalizedStringKey(GenericKeys.search)
    
    enum GenericKeys {
        static let ok = "general.action.ok"
        static let submit = "general.action.submit"
        static let cancel = "general.action.cancel"
        static let alertTitle = "general.error.alert.title"
        static let errorMessage = "general.error.message"
        static let signOutMessage = "general.sign.out.message"
        static let search = "general.action.search"
    }
    ///
    /// Login
    ///
    static let loginPrompt = LocalizedStringKey(LoginKeys.loginPrompt)
    static let loginUsername = LocalizedStringKey(LoginKeys.loginUsername)
    static let loginPassword = LocalizedStringKey(LoginKeys.loginPassword)
    
    enum LoginKeys {
        static let loginUsername = "login.username"
        static let loginPassword = "login.password"
        static let loginPrompt = "login.prompt.message"
    }
    ///
    /// Wacthlist
    ///
    static let watchlistName = LocalizedStringKey(WatchlistKeys.watchlistName)
    static let watchlistsTitle = LocalizedStringKey(WatchlistKeys.watchlistsTitle)
    static let addWatchlistPrompt = LocalizedStringKey(WatchlistKeys.addWatchlistPrompt)
    static let addWatchlist = LocalizedStringKey(WatchlistKeys.addWatchlist)
    static let searchSymbols = LocalizedStringKey(WatchlistKeys.searchSymbols)
    
    enum WatchlistKeys {
        static let watchlistName = "add.watchlist.name"
        static let watchlistsTitle  = "watchlists.title"
        static let addWatchlistPrompt = "add.watchlist.prompt.message"
        static let addWatchlist = "watchlist.add"
        static let searchSymbols = "symbols.search"
    }
    ///
    /// Stocks
    ///
    static let bid = LocalizedStringKey(StockKeys.bid)
    static let ask = LocalizedStringKey(StockKeys.ask)
    static let last = LocalizedStringKey(StockKeys.last)
    
    enum StockKeys {
        static let bid = "stock.bid"
        static let ask  = "stock.ask"
        static let last = "stock.last"
    }
    ///
    /// API
    ///
    static let invalidApiRequest = LocalizedStringKey(ApiKeys.invalidApiRequest)
    static let apiRetry = LocalizedStringKey(ApiKeys.apiRetry)
    
    enum ApiKeys {
        static let invalidApiRequest = "api.invalid.request"
        static let invalidResourcePath = "api.invalid.resource.path"
        static let apiRetry = "api.retry"
    }

}
