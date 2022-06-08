//
//  TabBar.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .tracking
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(tabItems) { item in
                Button{
                    selectedTab = item.tab
                }
            label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
//                    Text(item.text)
//                        .font(.caption2)
                }
                .frame(maxWidth: .infinity)
            } // For text inconsistency, otherwise use spacer
                //                    Spacer()
            .foregroundStyle(selectedTab == item.tab ? Color.theme.purple : Color.theme.purple.opacity(0.6))
                
            }
            
        }
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(Color.theme.purple.opacity(0.2), in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .background(Color.white, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .strokeStyle(cornerRaius: 34)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(text: "History", icon: "clock", tab: .history),
    TabItem(text: "Tracking", icon: "location", tab: .tracking),
    TabItem(text: "Account", icon: "person", tab: .account)
]

enum Tab: String {
    case history
    case tracking
    case account
}
