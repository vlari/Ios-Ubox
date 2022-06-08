//
//  LocationDetailView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

struct LocationDetailView: View {
    var fromLocation: String
    var toLocation: String
    
    var body: some View {
        HStack {
            
            VStack(alignment: .center) {
                Circle()
                    .fill(Color.theme.purple)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Circle()
                            .fill(Color.white)
                            .frame(width: 12, height: 12)
                    )
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.theme.purple)
                    .frame(width: 10, height: 40)
                
                Circle()
                    .fill(Color.theme.purple)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                    )
            }
            
            VStack(alignment: .leading) {
                Text(fromLocation)
                Spacer()
                Text(toLocation)
            }
            .font(.headline)
            .foregroundColor(Color.theme.purple)
            
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(fromLocation: "New York", toLocation: "United Kingdom")
    }
}
