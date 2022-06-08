//
//  PackageLocation.swift
//  ParcelApp
//
//  Created by Obed Garcia on 8/6/22.
//

import Foundation
import MapKit

struct PackageLocation: Identifiable {
    let id = UUID().uuidString
    let location: CLLocationCoordinate2D
}
