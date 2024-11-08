//
//  WatchlistResponse.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
struct WatchlistResponse: Decodable {
    
    var watchlist: Watchlist
    var marketData: [MarketData]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.watchlist = try container.decode(Watchlist.self, forKey: .data)
    }
}

