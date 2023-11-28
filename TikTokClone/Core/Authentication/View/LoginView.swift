//
//  LoginView.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 27/11/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel = LoginViewModel(authService: AuthService())
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                // logo image
                Image("tiktok-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                //text fields
                VStack{
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(StandardTextFieldModifier())
                }
                
                NavigationLink{
                    Text("Forgot password?")
                }label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
                
                //login button
                Button{
                    Task{await viewModel.login(withEmail: email, password: password)}
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.7)
                Spacer()
                
                //go to sign in
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?" )
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }

            }
        }
    }
}

// MARK: AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty
    }
    
    
}

#Preview {
    LoginView()
}
