//
//  WatchlistRequest.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
struct WatchlistRequest: Encodable {
    let name: String
    let groupName = ""
    let orderIndex: Int
    let watchlistEntries: [StockSymbol]
    
    init(name: String, orderIndex: Int = 0, watchlistEntries: [StockSymbol] = [StockSymbol]()) {
        self.name = name
        self.orderIndex = orderIndex
        self.watchlistEntries = watchlistEntries
    }

    enum CodingKeys: String, CodingKey {
        case name
        case groupName = "group-name"
        case orderIndex = "order-index"
        case watchlistEntries = "watchlist-entries"
    }
}
