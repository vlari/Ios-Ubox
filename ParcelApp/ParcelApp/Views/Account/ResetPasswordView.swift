//
//  ResetPasswordView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 21/5/22.
//

import SwiftUI

struct ResetPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @State private var password: String = ""
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
                    Image("lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .shadow(color: Color.theme.bubbleGum.opacity(0.3), radius: 4, x: 0, y: 4)
                        .opacity(isShowingView ? 1 : 0)
                        .animation(.easeIn.delay(0.1), value: isShowingView)
                        
                    Text("Create new password")
                        .font(.title2.bold())
                        .foregroundColor(Color.theme.purple)
                        .padding(.vertical)
                        .opacity(isShowingView ? 1 : 0)
                        .scaleEffect(isShowingView ? 1 : 0.8)
                        .animation(.easeIn.delay(0.5), value: isShowingView)
                    
                    resetForm
                    
                    Spacer()
                }
                .padding()
            }
            
        }
        .onAppear {
            isShowingView = true
        }
    }
    
    var resetForm: some View {
        VStack(spacing: 18) {
            PTextField(icon: "lock",
                       placeHolder: "Password",
                       textValue: $password)
            .opacity(isShowingView ? 1 : 0)
            .scaleEffect(isShowingView ? 1 : 0.8)
            .animation(.easeOut.delay(0.3), value: isShowingView)
            
            PTextField(icon: "lock",
                       placeHolder: "Re-type your new password",
                       textValue: $password)
            .opacity(isShowingView ? 1 : 0)
            .scaleEffect(isShowingView ? 1 : 0.8)
            .animation(.easeOut.delay(0.3), value: isShowingView)
            
            Text("Your new password must be 8 minimum characters.")
                .font(.headline)
                .foregroundColor(Color.theme.purple)
                .multilineTextAlignment(.leading)
                .opacity(isShowingView ? 1 : 0)
                .scaleEffect(isShowingView ? 1 : 0.8)
                .animation(.easeIn.delay(0.5), value: isShowingView)
            
            Button {
                
            } label: {
                Text("Reset")
            }
            .padding(.top)
            .buttonStyle(PButtontyle())
            .opacity(isShowingView ? 1 : 0)
            .scaleEffect(isShowingView ? 1 : 0.8)
            .animation(.easeIn.delay(0.3), value: isShowingView)
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
