//
//  TrackingSearchView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

struct TrackingSearchView: View {
    @State private var isImageShowing: Bool = false
    @State private var isTextFieldShowing: Bool = false
    @State private var isButtonShowing: Bool = false
    @State private var trackingNumber = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        VStack(spacing: 20) {
                            Group {
                                if isImageShowing {
                                    Image("location")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal)
                                        .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .opacity))
                                }
                            }
                            
                            HStack {
                                Image(systemName: "location")
                                    .padding(.horizontal)
                                    .foregroundColor(Color.theme.purple)
                                    
                                TextField("Tracking number", text: $trackingNumber)
                                    .padding(.vertical)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.theme.lightPurple)
                            )
                            .padding(.vertical)
                            .opacity(isTextFieldShowing ? 1 : 0)
                            .scaleEffect(isTextFieldShowing ? 1 : 0.8)
                            
                            NavigationLink {
                                TrackingDetailView(package: packages[0])
                            } label: {
                                Text("Track")
                            }
                            .padding(.top)
                            .opacity(isButtonShowing ? 1 : 0)
                            .scaleEffect(isButtonShowing ? 1 : 0.8)
                            .buttonStyle(PButtontyle())

                        }
                        .padding()
                        
                        Spacer()
                        
                    }
                    .padding()
                }
                
            }
            .navigationBarHidden(true)
            .onAppear {
                withAnimation(.easeIn.delay(0.2)) {
                    isImageShowing = true
                }
                
                withAnimation(.easeIn.delay(0.4)) {
                    isTextFieldShowing = true
                }
                
                withAnimation(.easeIn.delay(0.6)) {
                    isButtonShowing = true
                }
        }
        }
        
    }
}

struct TrackingSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingSearchView()
    }
}
