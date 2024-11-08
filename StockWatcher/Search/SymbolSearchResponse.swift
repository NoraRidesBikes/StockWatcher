//
//  SymbolSearchResponse.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
struct SymbolSearchResponse: Decodable {
    let items: [StockSymbol]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum SymbolItemsKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let symbolKeysContainer = try container.nestedContainer(keyedBy: SymbolItemsKeys.self, forKey: .data)
        self.items = try symbolKeysContainer.decode([StockSymbol].self, forKey: .items)
    }
}
