//
//  SearchSymbolsView.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import SwiftUI

struct SearchSymbolsView: View {
    
    @State var watchlist: Watchlist
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = SearchSymbolsViewModel()
    
    init(watchlist: Watchlist) {
        self.watchlist = watchlist
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.stockSymbols) { stockSymbol in
                    HStack {
                        Text(stockSymbol.symbol)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ZStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.white)
                                    .padding(.leading, 0)
                                    .font(.system(size: 18))
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .padding(.leading, 0)
                                    .font(.system(size: 18))
                        }.frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .onTapGesture {
                        Task {
                            await viewModel.addStockSymbol(stockSymbol: stockSymbol, to: watchlist)
                            dismiss()
                        }
                    }
                }
            }
            .safeAreaPadding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            .navigationTitle(.search)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text(.cancel)
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) {
            Task {
                await viewModel.search(searchString: searchText)
            }
        }
    }
}

#Preview {
    SearchSymbolsView(watchlist: Watchlist(name: "", groupName: "", orderIndex: 1, entries: []))
}

