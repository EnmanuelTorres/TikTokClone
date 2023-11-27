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
                Button(action: {print("DEBUG: Login") }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .padding(.vertical)
                
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

#Preview {
    LoginView()
}
