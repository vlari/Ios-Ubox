//
//  ContentDimension.swift
//  ParcelApp
//
//  Created by Obed Garcia on 8/6/22.
//

import Foundation

struct ContentDimention: Identifiable {
    var id = UUID().uuidString
    var unit: String
    var value: Double
    
    var formattedValue: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: value as NSNumber)!
    }
}
