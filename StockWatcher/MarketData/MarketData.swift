//
//  MarketData.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import Foundation

struct MarketData: Decodable, Identifiable {
    let id = UUID()
    let symbol: String
    let instrumentType: String
    let updatedAt: String
    let bid: String
    let ask: String
    let last: String
    let bidSize: Int
    let askSize: Int
    let summaryDate: String
    let prevCloseDate: String
    let open: String
    let close: String
    let prevClose: String
    let dayLowPrice: String
    let dayHighPrice: String
    let yearLowPrice: String
    let yearHighPrice: String
    let lowLimitPrice: String
    let highLimitPrice: String
    let isTradingHalted: Bool
    let mid: String
    let mark: String
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case instrumentType = "instrument-type"
        case updatedAt = "updated-at"
        case bid
        case ask
        case last
        case bidSize = "bid-size"
        case askSize = "ask-size"
        case summaryDate = "summary-date"
        case prevCloseDate = "prev-close-date"
        case open
        case close
        case prevClose = "prev-close"
        case dayLowPrice = "day-low-price"
        case dayHighPrice = "day-high-price"
        case yearLowPrice = "year-low-price"
        case yearHighPrice = "year-high-price"
        case lowLimitPrice = "low-limit-price"
        case highLimitPrice = "high-limit-price"
        case isTradingHalted = "is-trading-halted"
        case mid
        case mark
    }
    
    init(symbol: String, instrumentType: String, updatedAt: String, bid: String, ask: String, last: String, bidSize: Int, askSize: Int, summaryDate: String, prevCloseDate: String, open: String, close: String, prevClose: String, dayLowPrice: String, dayHighPrice: String, yearLowPrice: String, yearHighPrice: String, lowLimitPrice: String, highLimitPrice: String, isTradingHalted: Bool, mid: String, mark: String) {
        self.symbol = symbol
        self.instrumentType = instrumentType
        self.updatedAt = updatedAt
        self.bid = bid
        self.ask = ask
        self.last = last
        self.bidSize = bidSize
        self.askSize = askSize
        self.summaryDate = summaryDate
        self.prevCloseDate = prevCloseDate
        self.open = open
        self.close = close
        self.prevClose = prevClose
        self.dayLowPrice = dayLowPrice
        self.dayHighPrice = dayHighPrice
        self.yearLowPrice = yearLowPrice
        self.yearHighPrice = yearHighPrice
        self.lowLimitPrice = lowLimitPrice
        self.highLimitPrice = highLimitPrice
        self.isTradingHalted = isTradingHalted
        self.mid = mid
        self.mark = mark
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decodeIfPresent(String.self, forKey: .symbol) ?? ""
        self.instrumentType = try container.decodeIfPresent(String.self, forKey: .instrumentType) ?? ""
        self.updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        self.bid = try container.decodeIfPresent(String.self, forKey: .bid) ?? ""
        self.ask = try container.decodeIfPresent(String.self, forKey: .ask) ?? ""
        self.last = try container.decodeIfPresent(String.self, forKey: .last) ?? ""
        self.bidSize = try container.decodeIfPresent(Int.self, forKey: .bidSize) ?? 0
        self.askSize = try container.decodeIfPresent(Int.self, forKey: .askSize) ?? 0
        self.summaryDate = try container.decodeIfPresent(String.self, forKey: .summaryDate) ?? ""
        self.prevCloseDate = try container.decodeIfPresent(String.self, forKey: .prevCloseDate) ?? ""
        self.open = try container.decodeIfPresent(String.self, forKey: .open) ?? ""
        self.close = try container.decodeIfPresent(String.self, forKey: .close) ?? ""
        self.prevClose = try container.decodeIfPresent(String.self, forKey: .prevClose) ?? ""
        self.dayLowPrice = try container.decodeIfPresent(String.self, forKey: .dayLowPrice) ?? ""
        self.dayHighPrice = try container.decodeIfPresent(String.self, forKey: .dayHighPrice) ?? ""
        self.yearLowPrice = try container.decodeIfPresent(String.self, forKey: .yearLowPrice) ?? ""
        self.yearHighPrice = try container.decodeIfPresent(String.self, forKey: .yearHighPrice) ?? ""
        self.lowLimitPrice = try container.decodeIfPresent(String.self, forKey: .lowLimitPrice) ?? ""
        self.highLimitPrice = try container.decodeIfPresent(String.self, forKey: .highLimitPrice) ?? ""
        self.isTradingHalted = try container.decodeIfPresent(Bool.self, forKey: .isTradingHalted) ?? false
        self.mid = try container.decodeIfPresent(String.self, forKey: .mid) ?? ""
        self.mark = try container.decodeIfPresent(String.self, forKey: .mark) ?? ""
    }
}
