//
//  Package.swift
//  ParcelApp
//
//  Created by Obed Garcia on 8/6/22.
//

import Foundation

struct Package: Identifiable {
    let id = UUID().uuidString
    let trackingNumber: String
    let shipmentDetail: ShipmentDetail
    let contentDimensions: [ContentDimention] = [
        ContentDimention(unit: "Width", value: 20.8),
        ContentDimention(unit: "Height", value: 15),
        ContentDimention(unit: "Length", value: 18.7),
        ContentDimention(unit: "weight", value: 14.0)
    ]
    let packageStatus: PackageStatus
    
}

struct ShipmentDetail {
    let service: String
    let content: String
    let origin: String
    let destination: String
}

let packages: [Package] = [
    Package(trackingNumber: "#1234456789",
                                        shipmentDetail: ShipmentDetail(service: "Amazon",
                                                                       content: "Clothes",
                                                                       origin: "New York",
                                                                       destination: "United Kingdom"), packageStatus: .received),
    Package(trackingNumber: "#4763820983",
                                        shipmentDetail: ShipmentDetail(service: "Amazon",
                                                                       content: "Toys",
                                                                       origin: "Beijin",
                                                                       destination: "Miami"), packageStatus: .shipped),
    Package(trackingNumber: "#4763820967",
                                        shipmentDetail: ShipmentDetail(service: "Amazon",
                                                                       content: "Tech",
                                                                       origin: "Berlin",
                                                                       destination: "Quebec"), packageStatus: .received),
    Package(trackingNumber: "#4763820967",
                                        shipmentDetail: ShipmentDetail(service: "Amazon",
                                                                       content: "Tech",
                                                                       origin: "Berlin",
                                                                       destination: "Quebec"), packageStatus: .delivered)
]

enum PackageStatus: Int, CaseIterable {
    case received
    case shipped
    case available
    case delivered
}
