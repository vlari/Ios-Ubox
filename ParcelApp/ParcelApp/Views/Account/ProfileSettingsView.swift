//
//  ProfileSettingsView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 21/5/22.
//

import SwiftUI

struct ProfileSettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var isShowingView: Bool = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            ScrollView {
                HStack {
                    Circle()
                        .fill(Color.theme.purple.opacity(0.3))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "xmark")
                                .font(.headline)
                                .foregroundColor(Color.theme.purple)
                        )
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                .onTapGesture {
                    dismiss()
                }
                
                VStack(spacing: 18) {
                    VStack {
                        Image("avatar")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .shadow(color: Color.theme.bubbleGum.opacity(0.3), radius: 4, x: 0, y: 4)
                        
                        Text("John Doe")
                            .font(.title2.bold())
                            .foregroundColor(Color.theme.purple)
                            .padding(.vertical)
                    }
                    .opacity(isShowingView ? 1 : 0)
                    .animation(.easeIn.delay(0.4), value: isShowingView)
                    
                    profileForm
                }
                .padding()   
            }
            .padding(.horizontal, 5)
            
        }
        .onAppear {
            isShowingView = true
        }
        
    }
    
    var profileForm: some View {
        VStack(spacing: 18) {
            PTextField(icon: "person",
                       placeHolder: "Name",
                       textValue: $name)
            .opacity(isShowingView ? 1 : 0)
            .scaleEffect(isShowingView ? 1 : 0.8)
            .animation(.easeIn.delay(0.1), value: isShowingView)
                        
            PTextField(icon: "envelope",
                       placeHolder: "Email",
                       textValue: $email)
            .opacity(isShowingView ? 1 : 0)
            .scaleEffect(isShowingView ? 1 : 0.8)
            .animation(.easeIn.delay(0.3), value: isShowingView)
            
            PTextField(icon: "phone",
                       placeHolder: "Phone",
                       textValue: $phone)
            .opacity(isShowingView ? 1 : 0)
            .scaleEffect(isShowingView ? 1 : 0.8)
            .animation(.easeIn.delay(0.5), value: isShowingView)
            
            PTextField(icon: "house",
                       placeHolder: "Address",
                       textValue: $address)
            .opacity(isShowingView ? 1 : 0)
            .scaleEffect(isShowingView ? 1 : 0.8)
            .animation(.easeIn.delay(0.7), value: isShowingView)
            
            Button {
                
            } label: {
                Text("Save")
            }
            .padding(.top)
            .buttonStyle(PButtontyle())
            .opacity(isShowingView ? 1 : 0)
            .scaleEffect(isShowingView ? 1 : 0.8)
            .animation(.easeIn.delay(0.7), value: isShowingView)
        }
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
