//
//  OnBoardingContainerView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 7/6/22.
//

import SwiftUI

struct OnBoardingContainerView: View {
    @State var isOnboardingFinished: Bool = false
    
    var body: some View {
        Group {
            if isOnboardingFinished {
                SessionView()
            } else {
                OnBoardingView(isOnboardingFinished: $isOnboardingFinished)
            }
        }
    }
}

struct OnBoardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContainerView()
    }
}
