//
//  AddWatchlistView.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/6/24.
//
import SwiftUI

struct AddWatchlistView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isLoading = false
    @State private var watchlists: [Watchlist]
    @ObservedObject var viewModel = AddWatchlistViewModel()

    init(watchlists: [Watchlist]) {
        self.watchlists = watchlists
    }
    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Text(.cancel)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            FormLabel(key: .addWatchlistPrompt, systemImageName: .SystemImages.stopwatch)
            FormTextField(hint: .watchlistName, text: $viewModel.watchlistName)
            Divider()
            Spacer()
            
            SubmitButton(title: .submit) {
                await addWatchlist()
                if !viewModel.hasError {
                    dismiss()
                }
            }
        }
        .padding(30)
        .alert(.alertTitle, isPresented: $viewModel.hasError) {
            Button(.ok) {
                viewModel.reset()
            }
        } message: {
            Text( LocalizedStringKey(viewModel.errorKey) )
        }
    }
    ///
    /// Adds a new watchlist for the current user
    ///
    func addWatchlist() async {
        await viewModel.addWatchlist(at: watchlists.count)
    }
}

#Preview {
    AddWatchlistView(watchlists: [Watchlist]())
}
