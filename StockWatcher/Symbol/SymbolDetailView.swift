//
//  SymbolDetailView.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import SwiftUI

struct SymbolDetailView: View {

    @State private var stockSymbol: StockSymbol
    
    init(stockSymbol: StockSymbol) {
        self.stockSymbol = stockSymbol
    }
    
    var body: some View {
        NavigationStack {
            Text("Symbol Detail view for \(stockSymbol.symbol)")
        }
    }
}

#Preview {
    let symobol = StockSymbol(symbol: "AMC",
                              description:"",
                              listedMarket: "",
                              priceIncrements: "",
                              tradingHours: "",
                              autocomplete: 2,
                              options: false ,
                              instrumentType: "instrumentType")
    SymbolDetailView(stockSymbol: symobol)
}

