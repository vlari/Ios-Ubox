//
//  LocationStatusView.swift
//  ParcelApp
//
//  Created by Obed Garcia on 8/6/22.
//

import SwiftUI
import MapKit

struct LocationStatusView: View {
    @EnvironmentObject var appSetting: AppSetting
    @Environment(\.dismiss) var dismiss
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.51,
                                                                                  longitude: 13.38),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.8,
                                                                          longitudeDelta: 0.8))
    @State private var isShowingStatus: Bool = false
    var package: Package
    
    let pins: [PackageLocation] =  [
        PackageLocation(location: CLLocationCoordinate2D(latitude: 52.51, longitude: 13.38))
    ]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: pins) { pin in
                MapPin(coordinate: pin.location, tint: Color.theme.purple)
            }
            .ignoresSafeArea()

            VStack {
                HStack {
                    Button(action: {
                        appSetting.isTapBarShowing.toggle()
                        dismiss()
                    }, label: {
                        Circle()
                            .fill(Color.theme.purple.opacity(0.3))
                            .frame(width: 45, height: 45)
                            .overlay(
                                Image(systemName: "arrow.left")
                                    .foregroundColor(Color.theme.purple)
                                
                            )
                    })
                        .buttonStyle(PTapButtontyle())
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 20) {
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 6){
                            Text("From")
                                .foregroundColor(Color.theme.bubbleGum)
                            Text("New York")
                                .foregroundColor(Color.white)
                        }
                        .font(.headline)
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 6){
                            Text("To")
                                .foregroundColor(Color.theme.bubbleGum)
                            Text("Berlin")
                                .foregroundColor(Color.white)
                        }
                        .font(.headline)
                    }
                    .padding(.horizontal)
                    
                    RoundedRectangle(cornerRadius: 22)
                        .frame(height: 1)
                        .padding(.horizontal)
                        .foregroundColor(Color.theme.bubbleGum)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 6){
                            Text("Currently")
                                .foregroundColor(Color.theme.bubbleGum)
                            Text("Berlin")
                                .foregroundColor(Color.white)
                        }
                        .font(.headline)
                        
                        Spacer()
                        
                        Button {
                            isShowingStatus.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "shippingbox")
                                Text("Status")
                            }
                        }
                        .buttonStyle(PButtontyle(buttonStyle: .secondary))

                    }
                    .padding(.horizontal)
                    
                }
                .padding()
                .background(Color.theme.purple)
                .cornerRadius(22)
                .padding()
                
                
                
            }
            
        }
        .sheet(isPresented: $isShowingStatus) {
            
        } content: {
            PackageStatusView(package: package)
        }
        .navigationBarHidden(true)
        .onAppear {
            appSetting.isTapBarShowing = false
        }

        
    }
}

struct LocationStatusView_Previews: PreviewProvider {
    static var previews: some View {
        LocationStatusView(package: packages[0])
    }
}
