//
//  CreateWatchlistRequest.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
struct CreateWatchlistRequest: Encodable {
    let name: String
    let groupName = ""
    let orderIndex: Int
    let watchlistEntries = [StockSymbol]()

    enum CodingKeys: String, CodingKey {
        case name
        case groupName = "group-name"
        case orderIndex = "order-index"
        case watchlistEntries = "watchlist-entries"
    }
}
