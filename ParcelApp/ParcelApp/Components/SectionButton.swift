//
//  SectionButton.swift
//  ParcelApp
//
//  Created by Obed Garcia on 7/6/22.
//

import SwiftUI

struct SectionButton: View {
    var icon: String
    var title: String
    var buttonStyle: ThemeButtonStyle = .primary
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                Image(systemName: icon)
                    .frame(width: 30)
                
                Text(title)
                    .font(.headline)
                
                Spacer()
            }
            .font(.headline)
            .foregroundColor(buttonStyle == .primary ? Color.white : Color.theme.purple)
            .padding()
            .frame(height: 70)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(buttonStyle == .primary ? Color.theme.purple : Color.white)
                    .shadow(color: buttonStyle == .primary ? Color.theme.purple.opacity(0.3) : Color.gray.opacity(0.2),
                            radius: 4, x: 0, y: 3)
            )
        }
        .buttonStyle(PTapButtontyle())
    }
}

struct SectionButton_Previews: PreviewProvider {
    static var previews: some View {
        SectionButton(icon: "star", title: "Title") {
            
        }
    }
}
