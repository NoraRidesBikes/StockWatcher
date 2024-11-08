//
//  Watchlist.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import Foundation

struct Watchlist: Decodable, Identifiable {
    let id = UUID()
    var name: String
    var groupName: String
    var orderIndex: Int
    var entries: [StockSymbol]
    
    init(name: String, groupName: String = "", orderIndex: Int = 0, entries: [StockSymbol] = [StockSymbol]()) {
        self.name = name
        self.groupName = groupName
        self.orderIndex = orderIndex
        self.entries = entries
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case groupName = "group-name"
        case orderIndex = "order-index"
        case entries = "watchlist-entries"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.groupName = try container.decodeIfPresent(String.self, forKey: .groupName) ?? ""
        self.orderIndex = try container.decode(Int.self, forKey: .orderIndex)
        self.entries = try container.decodeIfPresent([StockSymbol].self, forKey: .entries) ?? [StockSymbol]()
    }
}
