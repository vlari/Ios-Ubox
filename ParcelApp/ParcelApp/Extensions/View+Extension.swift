//
//  View+Extension.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

extension View {
    func strokeStyle(cornerRaius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRaius))
    }
}
