//
//  TrackingHistoryView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 8/6/22.
//

import SwiftUI

struct TrackingHistoryView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var isShowingView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                ScrollView {
                    if isShowingView {
                        VStack {
                            DatePicker("From", selection: $startDate, in: ...Date(), displayedComponents: [.date])
                                
                            DatePicker("To", selection: $endDate, in: ...Date(), displayedComponents: [.date])
                        }
                        .padding()
                        .font(.headline)
                        .foregroundColor(Color.theme.purple)
                        .transition(.scale)
                    }
                    
                    VStack {

                        ForEach(packages) { package in
                            NavigationLink {
                                TrackingDetailView(package: package)
                            } label: {
                                PackageCard(trackingNumber: package.trackingNumber,
                                            shipmentDetail: package.shipmentDetail)
                            }
                            .buttonStyle(PTapButtontyle())
                        }

                    }
                    .padding()
                }
                .opacity(isShowingView ? 1 : 0)
                
            }
            .navigationTitle("History")
            .onAppear {
                withAnimation(.easeOut(duration: 0.4)) {
                    isShowingView = true
                }
            }
        }
    }
}

struct TrackingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingHistoryView()
    }
}
