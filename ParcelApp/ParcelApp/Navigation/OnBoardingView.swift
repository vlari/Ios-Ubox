//
//  OnBoardingView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var onBoardingState: OnBoardingState = .loading
    @Binding var isOnboardingFinished: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Group {
                    if onBoardingState == .firstScreen {
                        Image("man")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity))
                    } else if onBoardingState == .secondScreen {
                        Image("packagelocation")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .transition(AnyTransition.asymmetric(insertion: .move(edge: .top), removal: .opacity))
                    }
                }
                
                Text(onBoardingState == .firstScreen
                     ? "Be in control"
                     : "Real-time tracking")
                    .font(.title.bold())
                    .foregroundColor(Color.theme.purple)
                    .opacity(onBoardingState == .loading ? 0 : 1)

                Text(onBoardingState == .firstScreen
                     ? "Search your packages and see history section."
                     : "Track your packages in real time")
                    .font(.body)
                    .foregroundColor(Color.theme.purple)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .opacity(onBoardingState == .loading ? 0 : 1)
                
                Spacer()
                    
                Button {
                    if onBoardingState == .secondScreen {
                        isOnboardingFinished.toggle()
                    } else {
                        withAnimation(.spring()) {
                            onBoardingState = .secondScreen
                        }
                    }
                } label: {
                    Text(onBoardingState == .secondScreen ? "Get Started" : "Next")
                }
                .buttonStyle(PButtontyle())
                
            }
            .padding()
            
        }
        .onAppear {
            withAnimation(.spring().delay(0.4)) {
                onBoardingState = .firstScreen
            }
        }
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            OnBoardingView(isOnboardingFinished: .constant(true))
        }
    }
}

enum OnBoardingState {
    case loading
    case firstScreen
    case secondScreen
}
