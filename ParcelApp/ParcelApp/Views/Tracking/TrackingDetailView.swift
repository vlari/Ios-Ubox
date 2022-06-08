//
//  TrackingDetailView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

struct TrackingDetailView: View {
    @State private var isTrackingHeaderShowing: Bool = false
    @State private var isTrackingDetailShowing: Bool = false
    @State private var isTrackingContentShowing: Bool = false
    @State private var isButtonShowing: Bool = false
    var package: Package
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    trackingHeader
                        .opacity(isTrackingHeaderShowing ? 1 : 0)
                    
                    trackingDetail
                        .opacity(isTrackingDetailShowing ? 1 : 0)
                    
                    trackingContent
                        .opacity(isTrackingContentShowing ? 1 : 0)
                    
                    NavigationLink {
                        LocationStatusView(package: package)
                    } label: {
                        Text("See Status")
                    }
                    .buttonStyle(PButtontyle())
                    .opacity(isButtonShowing ? 1 : 0)
                    .scaleEffect(isButtonShowing ? 1 : 0.8)

                    Spacer()
                }
                .padding(.horizontal)
            }
            
        }
        .navigationTitle("Your Package")
        .onAppear {
            withAnimation(.easeIn.delay(0.2)) {
                isTrackingHeaderShowing = true
            }
            
            withAnimation(.easeIn.delay(0.4)) {
                isTrackingDetailShowing = true
            }
            
            withAnimation(.easeIn.delay(0.6)) {
                isTrackingContentShowing = true
            }
            
            withAnimation(.easeIn.delay(0.8)) {
                isButtonShowing = true
            }
        }
    }
    
    var trackingHeader: some View {
        HStack {
            VStack(alignment: .leading, spacing: 18) {
                Text("Tracking number")
                    .font(.title3.bold())
                    .foregroundColor(Color.theme.purple)
                
                HStack {
                    Image(systemName: "shippingbox.fill")
                        .font(.title2)
                    Text(package.trackingNumber)
                        .font(.title3.bold())
                }
                .foregroundColor(Color.theme.purple)
            }
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "doc.on.doc")
                    .font(.title3)
            }
            .buttonStyle(PButtontyle(width: 60, height: 60))
        }
        .padding(.vertical)
    }
    
    var trackingDetail: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Shipment detail")
                .font(.title3.bold())
                .foregroundColor(Color.theme.purple)
            
            PackageCard(trackingNumber: package.trackingNumber,
                        shipmentDetail: package.shipmentDetail)
            
        }
        .padding(.vertical)
    }
    
    var trackingContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Dimensions")
                .font(.title3.bold())
                .foregroundColor(Color.theme.purple)
            
            VStack {
                HStack(spacing: 10) {
                    ForEach(package.contentDimensions) { contentDimention in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(contentDimention.unit)
                                .font(.headline)
                                .foregroundColor(Color.theme.purple)
                            Text(contentDimention.formattedValue)
                                .font(.body)
                                .foregroundColor(Color.theme.bubbleGum)
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(.white)
                    .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 3)
            )
        }
        .padding(.vertical)
    }
}

struct TrackingDetailView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        TrackingDetailView(package: packages[0])
    }
}




