//
//  ParcelAppApp.swift
//  ParcelApp
//
//  Created by Obed Garcia on 20/5/22.
//

import SwiftUI

@main
struct ParcelAppApp: App {
    @StateObject var appSetting = AppSetting()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appSetting)
        }
    }
}
