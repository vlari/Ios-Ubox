//
//  SessionView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 21/5/22.
//

import SwiftUI

struct SessionView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingForm: Bool = false
    @State private var isSignInMode: Bool = true

    // This way is for UI demo only. Must be decoupled.
    func unlockMainView() {
        UserDefaults.standard.set(false, forKey: "isfirsttimeuser")
    }
    
    var body: some View {
        ZStack {
            Color.theme.lightPurple
                .ignoresSafeArea()
            
            formBackground
            
            if isShowingForm {
                sessionForm
                    .transition(.scale)
            }
        }
        .onAppear {
            withAnimation(.spring()) {
                isShowingForm = true
            }
        }
        
    }
    
    var sessionForm: some View {
        VStack(spacing: 20) {
            HStack {
                Text(isSignInMode ? "Sign In" : "Sign Up")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
            }
            
            VStack(spacing: 25) {
                PTextField(icon: "envelope",
                           placeHolder: "Email",
                           textValue: $email)
                
                PTextField(icon: "key",
                           placeHolder: "Password",
                           textValue: $password)
            }
            .padding(.vertical)
            
            Button {
                unlockMainView()
            } label: {
                Text(isSignInMode ? "Sign In" : "Sign Up")
            }
            .padding(.horizontal)
            .buttonStyle(PButtontyle(buttonStyle: .secondary))

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.lightPurple)
                .frame(height: 1)
            
            HStack {
                Text(isSignInMode ? "You don’t have an account?" : "Aldready have an account?")
                    .foregroundColor(.white)
                Button {
                    isSignInMode.toggle()
                } label: {
                    Text(isSignInMode ? "Sign In": "Sign Up")
                        .bold()
                }
                .foregroundColor(Color.theme.bubbleGum)
                .buttonStyle(PTapButtontyle())
                Spacer()
            }
            .font(.body)
            .padding(.bottom)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.theme.purple)
        )
        .padding(.horizontal)
        .shadow(color: Color.theme.purple.opacity(0.4), radius: 5, x: 0, y: 4)
    }
    
    var formBackground: some View {
        VStack {
            GeometryReader { proxy in
                HStack {
                    Image("woman")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 0, y: isShowingForm ? 0 : (proxy.size.height / 2))
                    Spacer()
                }
            }

            GeometryReader { proxy in
                HStack {
                    Spacer()
                    Image("box")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 0, y: isShowingForm ? 0 : -(proxy.size.height / 2))
                }
            }
        }
        .padding()
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SessionView()
        }
    }
}
