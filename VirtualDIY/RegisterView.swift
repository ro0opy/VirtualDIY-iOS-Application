//
//  RegisterView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isRegister: Bool = false // State untuk navigasi

    var body: some View {
        NavigationView {
            VStack {
                // Logo di atas
                Image("VDA") // Ganti dengan nama asset logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 50)
                Spacer()
                
                // Kotak Kuning Login Form
                VStack(alignment: .leading, spacing: 20) {
                    Text("Username :")
                        .font(.headline)
                        .foregroundColor(.black)
                    TextField("", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                    
                    Text("Email :")
                        .font(.headline)
                        .foregroundColor(.black)
                    SecureField("", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Password :")
                        .font(.headline)
                        .foregroundColor(.black)
                    SecureField("", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Register Button
                    NavigationLink(
                        destination: MainView().navigationBarBackButtonHidden(true),
                        isActive: $isRegister
                    ) {
                        Button(action: {
                            // Validasi input bisa ditambahkan di sini
                            isRegister = true
                        }) {
                            Text("Register")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top, 10)
                }
                .padding()
                .background(Color.yellow)
                .cornerRadius(15)
                .padding(.horizontal, 30)
                
                Spacer()
            }
            .background(Color.white.ignoresSafeArea())
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

