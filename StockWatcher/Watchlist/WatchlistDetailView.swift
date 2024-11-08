//
//  WatchlistDetailView.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
//
//  WatchlistView.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import SwiftUI

struct WatchlistDetailView: View {

    @State private var showingSearchSymbolsSheet = false
    @ObservedObject var viewModel: WatchlistDetailViewModel
    
    init(watchlist: Watchlist) {
        self.viewModel = WatchlistDetailViewModel(watchlist: watchlist)
    }

    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(viewModel.watchlist.entries) { stockSymbol in
                    NavigationLink(destination: SymbolDetailView(stockSymbol: stockSymbol)) {
                        StockSymbolCard(stockSymbol: stockSymbol)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .background(.clear)
                            .foregroundColor( Color.gray.opacity(0.3) )
                            .padding(
                                EdgeInsets(
                                    top: 2,
                                    leading: 10,
                                    bottom: 5,
                                    trailing: 10
                                )
                            )
                    )
                }
                .onDelete(perform: removeStockSymbol)
            }
            .listStyle(.plain)
            .safeAreaPadding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
            .navigationTitle(viewModel.watchlist.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: searchStockSymbols) {
                        Label(.searchSymbols, systemImage: .SystemImages.magnifyingGlass)
                    }
                }
                if !viewModel.watchlist.entries.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Text("\(viewModel.lastUpdated)")
                         .font(.footnote)
                         .foregroundColor(.secondary)
                         .frame(maxWidth: .infinity)
                         .textSelection(.enabled)
                     }
            }
            .task {
                repeat {
                    await viewModel.fetchWatchlist()
                    do {
                        try await Task.sleep(for: .seconds(viewModel.refreshSeconds))
                    } catch {
                        print(error)
                    }
                } while (!Task.isCancelled)
            }
            .sheet(isPresented: $showingSearchSymbolsSheet, onDismiss: {
                Task {
                    await viewModel.fetchWatchlist()
                }
            }, content: {
                SearchSymbolsView(watchlist: viewModel.watchlist)
            })
        }
    }

    private func searchStockSymbols() {
        showingSearchSymbolsSheet = true
    }

    private func removeStockSymbol(offsets: IndexSet) {
        let _ = withAnimation {
            Task {
                await viewModel.removeStockSymbol(at: offsets)
            }
        }
    }
}

#Preview {
    WatchlistDetailView(watchlist: Watchlist(name: "Watchlist Name", entries: [StockSymbol]()))
}
