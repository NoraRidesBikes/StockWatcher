//
//  WatchlistResponse.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
struct WatchlistsResponse: Decodable {
    let watchlists: [Watchlist]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum WatchlistKeys: String, CodingKey {
        case watchlists = "items"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let watchlistKeysContainer = try container.nestedContainer(keyedBy: WatchlistKeys.self, forKey: .data)
        self.watchlists = try watchlistKeysContainer.decode([Watchlist].self, forKey: .watchlists)
    }
}
