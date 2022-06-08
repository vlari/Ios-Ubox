//
//  PButtonStyle.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import Foundation
import SwiftUI

struct PButtontyle: ButtonStyle {
    var buttonStyle: ThemeButtonStyle = .primary
    var width: CGFloat = 150
    var height: CGFloat = 59
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.subheadline)
            .foregroundColor(buttonStyle == .primary ? .white : Color.theme.purple)
            .padding()
            .frame(width: width, height: height)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(buttonStyle == .primary ? Color.theme.purple : Color.white)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: buttonStyle == .primary
                    ? Color.theme.purple.opacity(0.3)
                    : Color.white.opacity(0.3),
                    radius: 5, x: 0, y: 4)
    }
}

struct PTapButtontyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

enum ThemeButtonStyle {
    case primary
    case secondary
}
