//
//  MarketDataResponse.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
struct MarketDataResponse: Decodable {
    
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.marketData = try container.decode(MarketData.self, forKey: .data)
    }
}
