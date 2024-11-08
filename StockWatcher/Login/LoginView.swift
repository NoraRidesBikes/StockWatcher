//
//  LoginView.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/4/24.
//
import SwiftUI

struct LoginView: View {
    
    @State private var isLoading = false
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        
        VStack{
            
            Spacer()
            FormLabel(key: .loginPrompt, systemImageName: .SystemImages.person)
            FormTextField(hint: .loginUsername, text: $viewModel.username)
            Divider()
            SecureField(.loginPassword, text: $viewModel.password)
                .padding(.top, 20)
            Divider()
            Spacer()
            
            SubmitButton(title: .submit) {
                await login()
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
    
    func login() async {
        await viewModel.login()
    }
}

#Preview {
    LoginView()
}
