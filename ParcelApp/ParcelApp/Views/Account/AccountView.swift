//
//  AccountView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

struct AccountView: View {
    @State private var isShowingView: Bool = false
    @State private var isShowingProfile: Bool = false
    @State private var isShowingPasswordChange: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.purple
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    VStack {
                        Image("avatar")
                            .resizable()
                            .frame(width: 120, height: 120)
                        
                        Text("John Doe")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.vertical)
                    }
                    .opacity(isShowingView ? 1 : 0)
                    .animation(.easeIn.delay(0.4), value: isShowingView)
                    
                    Spacer()
                    
                    ZStack() {
                        VStack(spacing: 18) {
                            
                            SectionButton(icon: "slider.horizontal.3",
                                          title: "Profile settings",
                                          buttonStyle: .secondary, onTap: {
                                isShowingProfile.toggle()
                            })
                                .opacity(isShowingView ? 1 : 0)
                                .scaleEffect(isShowingView ? 1 : 0.8)
                                .animation(.spring().delay(0.5), value: isShowingView)
                                .sheet(isPresented: $isShowingProfile) {
                                    
                                } content: {
                                    ProfileSettingsView()
                                }
                            
                            SectionButton(icon: "key",
                                          title: "Change password",
                                          buttonStyle: .secondary, onTap: {
                                isShowingPasswordChange.toggle()
                            })
                                .opacity(isShowingView ? 1 : 0)
                                .scaleEffect(isShowingView ? 1 : 0.8)
                                .animation(.spring().delay(0.5), value: isShowingView)
                                .sheet(isPresented: $isShowingPasswordChange) {
                                    
                                } content: {
                                    ResetPasswordView()
                                }
                            
                            addressSection
                            
                            Spacer()
                        }
                        .padding()
                        .padding(.top, 40)
                    }
                    
                }
                
            }
            
        }
        .onAppear {
            isShowingView = true
        }
        
    }
    
    var addressSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Main shipping address")
                    .font(.headline.bold())
                
                Text("4624 N.W. 74th Ave. Unit 4 Doral, FL 33166 305-599-3939 United States")
                    .font(.subheadline)
                    .lineLimit(4)
            }
            
            Spacer()
        }
        .foregroundColor(Color.theme.purple)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 3)
        )
        .opacity(isShowingView ? 1 : 0)
        .scaleEffect(isShowingView ? 1 : 0.8)
        .animation(.spring().delay(0.9), value: isShowingView)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .previewInterfaceOrientation(.portrait)
    }
}
