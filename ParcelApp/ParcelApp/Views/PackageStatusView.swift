//
//  PackageStatusView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 8/6/22.
//

import SwiftUI

struct PackageStatusView: View {
    @Environment(\.dismiss) var dismiss
    var package: Package
    
    func getStatusDescription(from index: Int) -> String {
            switch index {
            case 0:
                return "Received"
            case 1:
                return "Shipped"
            case 2:
                return "Available"
            case 3:
                return "Delivered"
            default:
                return "None"
        }
    }
    
    var body: some View {
        ZStack {
            Color.theme.lightPurple
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Circle()
                            .fill(Color.theme.purple.opacity(0.3))
                            .frame(width: 30, height: 30)
                            .overlay(
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.theme.purple)
                                
                            )
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    .padding(.vertical)
                    
                    Text("Package Status")
                        .frame(maxWidth: .infinity)
                        .font(.title2.bold())
                        .foregroundColor(Color.theme.purple)
                    
                    Text(package.trackingNumber)
                        .padding()
                        .font(.title3)
                        .foregroundColor(Color.black.opacity(0.5))
                    
                    
                    
                    ForEach(0...package.packageStatus.rawValue, id: \.self) { status in
                        
                        HStack {
                            Circle()
                                .fill(Color.theme.purple)
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color.theme.lightPurple)
                                )
                            
                            VStack {
                                Text(getStatusDescription(from: status))
                                    .font(.headline)
                                    .foregroundColor(Color.theme.purple)
//                                    .padding(.horizontal)
                                
                                Text("10:55 AM")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.secondary)
                            }
                            .padding(.horizontal)

                        }
                        
                        if status != package.packageStatus.rawValue {
                            RoundedRectangle(cornerRadius: 18)
                                .frame(width: 10, height: 60)
                                .foregroundColor(Color.theme.purple)
                                .padding(.leading, 10)
                        }
                        
                    }
                }
                
            }
            .padding()
        }
    }
}

struct PackageStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PackageStatusView(package: packages[1])
    }
}
