//
//  StockSymbolCard.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import SwiftUI

struct StockSymbolCard: View {

    @State private var stockSymbol: StockSymbol
    
    init(stockSymbol: StockSymbol)  {
        self.stockSymbol = stockSymbol
    }
    
    var body: some View {

        HStack {
            VStack {
                Text(stockSymbol.symbol)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                HStack{
                    HStack {
                        Text(.bid)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(stockSymbol.marketData?.bid ?? "")
                            .font(.callout)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text(.ask)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(stockSymbol.marketData?.ask ?? "")
                            .font(.callout)
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Text(.last)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(stockSymbol.marketData?.last ?? "")
                            .font(.callout)
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                    
                }.frame(maxWidth: .infinity)
            }
        }
        .padding(12.0)
        .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
        .contentShape(Rectangle())
    }
}

#Preview {

    let marketData = MarketData(symbol: "AMC",
                                instrumentType: "Equity",
                                updatedAt: "2024-11-08T00:00:00.001Z",
                                bid: "17.3",
                                ask: "18.31",
                                last: "17.85",
                                bidSize: 1,
                                askSize: 1,
                                summaryDate: "2024-11-07",
                                prevCloseDate: "2024-11-06",
                                open: "17.6",
                                close: "17.85",
                                prevClose: "17.85",
                                dayLowPrice: "17.125",
                                dayHighPrice: "18.17",
                                yearLowPrice: "15.05",
                                yearHighPrice: "21.24",
                                lowLimitPrice: "21.24",
                                highLimitPrice: "21.24",
                                isTradingHalted: false,
                                mid: "21.24",
                                mark: "21.24")

    let symbol = StockSymbol(symbol: "Test",
                              description:"",
                              listedMarket: "",
                              priceIncrements: "",
                              tradingHours: "",
                              autocomplete: 2,
                              options: false ,
                              instrumentType: "instrumentType",
                              marketData: marketData)
    
    StockSymbolCard(stockSymbol: symbol)
}
