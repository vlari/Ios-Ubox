//
//  ContentView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appSetting: AppSetting
    @AppStorage("isfirsttimeuser") public var isFirstTimeUser: Bool = true
    @AppStorage("selectedTab") var selectedTab: Tab = .tracking
    
    var body: some View {
        VStack {
            if isFirstTimeUser {
                OnBoardingContainerView()
            } else {
                ZStack {
                    Group {
                        switch selectedTab {
                        case .history:
                            TrackingHistoryView()
                        case .tracking:
                            TrackingSearchView()
                        case .account:
                            AccountView()
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    TabBar()
                        .offset(y: appSetting.isTapBarShowing ? 0 : 200)
                }
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 50)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
