//
//  PackageCard.swift
//  ParcelApp
//
//  Created by Obed Garcia on 7/6/22.
//

import SwiftUI

struct PackageCard: View {
    var trackingNumber: String
    var shipmentDetail: ShipmentDetail
    var isShowingTrackingNumber: Bool = false
    
    var body: some View {
        VStack {
            
            if isShowingTrackingNumber {
                HStack {
                    Image(systemName: "shippingbox.fill")
                        .font(.title2)
                    Text(trackingNumber)
                        .font(.title3.bold())
                    
                    Spacer()
                }
                .foregroundColor(Color.theme.purple)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Service")
                        .font(.headline)
                        .foregroundColor(Color.theme.purple)
                    Text(shipmentDetail.service)
                        .font(.body)
                        .foregroundColor(Color.theme.bubbleGum)
                    
                    Spacer()
                    
                    Text("Content")
                        .font(.headline)
                        .foregroundColor(Color.theme.purple)
                    Text(shipmentDetail.content)
                        .font(.body)
                        .foregroundColor(Color.theme.bubbleGum)
                }
                .frame(height: 100)
                .padding(.vertical)
                .padding(.trailing, 40)
                
                //Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    LocationDetailView(fromLocation: shipmentDetail.origin, toLocation: shipmentDetail.destination)
                        .frame(height: 110)
                }
                
                Spacer()
            }

        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(.white)
                .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 3)
            
        )
    }
}

struct PackageCard_Previews: PreviewProvider {
    static var previews: some View {
        PackageCard(trackingNumber: "#12345678910", shipmentDetail: ShipmentDetail(service: "Amazon", content: "Clothes", origin: "New York", destination: "United Kingdom"))
    }
}
