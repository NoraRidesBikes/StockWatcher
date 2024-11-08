//
//  SubmitButton.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import SwiftUI

struct SubmitButton: View {

    @State private var title: LocalizedStringKey
    @State private var isLoading = false
    @State private var action: () async -> Void
    
    init(title: LocalizedStringKey, action: @escaping () async -> Void)  {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(
            action: {
                guard !isLoading else {
                    return
                }
                
                isLoading = true

                Task {
                    await self.action()
                    isLoading = false
                }
            },
            label: {
                if isLoading {
                    ProgressView().frame(maxWidth: .infinity)
                } else {
                    Text(self.title)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
            }
        )
    }
}

#Preview {
    SubmitButton(title: .submit) {
        try! await Task.sleep(nanoseconds: 1_000_000_000)
    }
}
