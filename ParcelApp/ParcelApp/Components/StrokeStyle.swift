//
//  StrokeStyle.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(Color.theme.purple)
                .blendMode(.overlay)
            
        )
    }
}
