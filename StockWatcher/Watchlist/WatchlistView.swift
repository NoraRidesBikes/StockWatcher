//
//  WatchlistView.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import SwiftUI
import Foundation

struct WatchlistView: View {
    
    @EnvironmentObject var auth: AuthService
    @State private var showingAddWatchlistSheet = false
    @ObservedObject var viewModel: WatchlistViewModel = WatchlistViewModel()

    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.watchlists) { watchlist in
                    NavigationLink {
                        WatchlistDetailView(watchlist: watchlist)
                    } label: {
                        Text(watchlist.name)
                    }
                }
                .onDelete(perform: deleteWatchlist)
            }
            .safeAreaPadding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            .navigationTitle(.watchlistsTitle)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        signOut()
                    } label: {
                        Text(.signOutMessage)
                    }
                }
                if !viewModel.watchlists.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: addWatchlist) {
                        Label(.addWatchlist, systemImage: .SystemImages.plus)
                    }
                }
            }
        }
        .task {
            if !auth.unauthorized {
                await viewModel.fetchWatchlists()
            }
        }
        .fullScreenCover(isPresented: $auth.unauthorized, onDismiss: {
            Task {
                await viewModel.fetchWatchlists()
            }
        }, content: {
            LoginView()
        })
        .sheet(isPresented: $showingAddWatchlistSheet, onDismiss: {
            Task {
                await viewModel.fetchWatchlists()
            }
        }, content: {
            AddWatchlistView(watchlists: viewModel.watchlists)
        })
        .alert(.alertTitle, isPresented: $viewModel.hasError) {
            Button(.ok) {
                viewModel.reset()
                }
            } message: {
                Text( LocalizedStringKey(viewModel.errorKey) )
            }
    }
    ///
    /// Signs out of the app by removing the auth tokens from the keychain
    ///
    private func signOut() {
        auth.deauthorize()
    }
    ///
    /// Presents the view to add a new Watchlist to the app
    ///
    private func addWatchlist() {
        showingAddWatchlistSheet = true
    }
    ///
    /// Deletes the selected watchlist
    ///
    private func deleteWatchlist(offsets: IndexSet) {
        let _ = withAnimation {
            Task {
                await viewModel.deleteWatchlist(atOffsets: offsets)
            }
        }
    }
}

#Preview {
    WatchlistView()
        .environmentObject(AuthService.shared)
}
