//
//  StockSymbol.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import Foundation

struct StockSymbol: Codable, Identifiable {
    let id = UUID()
    let symbol: String
    let description: String
    let listedMarket: String
    let priceIncrements: String
    let tradingHours: String
    let autocomplete: Int
    let options: Bool
    let instrumentType: String
    var marketData: MarketData?
 
    enum CodingKeys: String, CodingKey {
        case symbol
        case description
        case listedMarket = "listed-market"
        case priceIncrements = "price-increments"
        case tradingHours = "trading-hours"
        case autocomplete
        case options
        case instrumentType = "instrument-type"
    }
    
    init(symbol: String, description: String, listedMarket: String, priceIncrements: String, tradingHours: String, autocomplete: Int, options: Bool, instrumentType: String, marketData: MarketData? = nil) {
        self.symbol = symbol
        self.description = description
        self.listedMarket = listedMarket
        self.priceIncrements = priceIncrements
        self.tradingHours = tradingHours
        self.autocomplete = autocomplete
        self.options = options
        self.instrumentType = instrumentType
        self.marketData = marketData
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.instrumentType = try container.decode(String.self, forKey: .instrumentType)
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.listedMarket = try container.decodeIfPresent(String.self, forKey: .listedMarket) ?? ""
        self.priceIncrements = try container.decodeIfPresent(String.self, forKey: .priceIncrements) ?? ""
        self.tradingHours = try container.decodeIfPresent(String.self, forKey: .tradingHours) ?? ""
        self.autocomplete = try container.decodeIfPresent(Int.self, forKey: .autocomplete) ?? 2
        self.options = try container.decodeIfPresent(Bool.self, forKey: .options) ?? false
    }
}
