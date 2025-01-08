//
//  SubscriptionView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct SubscriptionView: View {
    @State private var selectedPackage: String? = nil
    @State private var isLoggedOut: Bool = false
    @State private var showLogoutConfirmation: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    // Logo dan Butang Logout
                    HStack {
                        Image("VDA") // Gantikan nama imej sesuai
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 80)
                        
                        Spacer()
                        
                        Button(action: {
                            // Tambahkan logik logout di sini
                        }) {
                                Text("Log Out")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                        }
                        .confirmationDialog("Are you sure you want to log out?", isPresented: $showLogoutConfirmation, titleVisibility: .visible) {
                            Button("Log Out", role: .destructive) {
                                isLoggedOut = true
                            }
                            Button("Cancel", role: .cancel) {}
                            }
                    }
                    .padding()
                    
                    // Profil Pengguna
                    VStack {
                        Image("People") // Gantikan nama imej sesuai
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        
                        Text("Yearly VIP")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    // Bahagian Langganan
                    VStack(alignment: .leading) {
                        Text("Subscriptions")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                // Yearly Premium Package
                                Button(action: {
                                    selectedPackage = "Yearly Premium User Package"
                                }) {
                                    VStack(alignment: .leading, spacing: 5) {
                                        HStack {
                                            Text("Yearly Premium User Package")
                                                .font(.headline)
                                            Spacer()
                                            Text("👑 VIP")
                                        }
                                        Text("RM 69.99")
                                            .font(.title3)
                                            .bold()
                                    }
                                    .padding()
                                    .frame(width: 300, height: 120)
                                    .background(selectedPackage == "Yearly Premium User Package" ? Color.yellow.opacity(0.7) : Color.yellow.opacity(0.3))
                                    .cornerRadius(10)
                                }
                                
                                // Monthly Premium Package
                                Button(action: {
                                    selectedPackage = "Monthly Premium User Package"
                                }) {
                                    VStack(alignment: .leading, spacing: 5) {
                                        HStack {
                                            Text("Monthly Premium User Package")
                                                .font(.headline)
                                            Spacer()
                                            Text("👑 VIP")
                                        }
                                        Text("RM 39.99")
                                            .font(.title3)
                                            .bold()
                                    }
                                    .padding()
                                    .frame(width: 300, height: 120)
                                    .background(selectedPackage == "Monthly Premium User Package" ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom)
                    
                    // Bahagian Kaedah Pembayaran
                    VStack(alignment: .leading) {
                        Text("Payment method")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        HStack {
                            Button(action: {
                                // Logik pembayaran FPX
                            }) {
                                Image("FPX") // Gantikan nama imej sesuai
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding(15)
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                // Logik pembayaran Kad Kredit
                                isLoggedOut = true
                            }) {
                                HStack {
                                    Image(systemName: "creditcard")
                                        .font(.title)
                                    Text("Credit Card")
                                        .bold()
                                }
                                .padding(40)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                    
                    // Bahagian Ciri VIP
                    VStack(alignment: .leading) {
                        Text("VIP Features")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        HStack(spacing: 10) {
                            Button(action: {
                                // Logik untuk AR Visualisation
                            }) {
                                Text("AR Visualisation")
                                    .bold()
                                    .padding(25.9)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.yellow.opacity(0.3))
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                // Logik untuk Community Support
                            }) {
                                Text("Community Support")
                                    .bold()
                                    .padding(15)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.yellow.opacity(0.3))
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                    
                }
            }
        .navigationDestination(isPresented: $isLoggedOut) {
            LoginView()
        }
            .navigationTitle("")
        }
    }


#Preview {
    SubscriptionView()
}

