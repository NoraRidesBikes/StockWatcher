//
//  FormLabel.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import SwiftUI

struct FormLabel: View {

    @State private var key: LocalizedStringKey
    @State private var systemImageName: String
    
    init(key: LocalizedStringKey, systemImageName: String)  {
        self.key = key
        self.systemImageName = systemImageName
    }
    
    var body: some View {
        Label(key, systemImage: systemImageName)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    FormLabel(key: .addWatchlistPrompt, systemImageName: .SystemImages.stopwatch)
}
