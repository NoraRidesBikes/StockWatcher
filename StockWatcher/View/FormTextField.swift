//
//  FormTextField.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/7/24.
//
import SwiftUI

struct FormTextField: View {

    @State private var hint: LocalizedStringKey
    @Binding var text: String
    
    init(hint: LocalizedStringKey, text: Binding<String>)  {
        self.hint = hint
        self._text = text
    }
    
    var body: some View {
        TextField(self.hint,text: self.$text)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .padding(.top, 20)
    }
}

#Preview {
    @Previewable @State var text = "Text field value"
    return FormTextField(hint: .addWatchlistPrompt, text: $text)
}
