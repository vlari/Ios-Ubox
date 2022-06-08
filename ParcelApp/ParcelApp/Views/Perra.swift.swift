//
//  Perra.swift.swift
//  ParcelApp
//
//  Created by Obed Garcia on 22/5/22.
//

import SwiftUI

struct Perra_swift: View {
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink {
                    Perra2()
                } label: {
                    Text("Presionar")
                        .foregroundColor(.white)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.theme.purple)
                )
                
            }
            .navigationTitle("Perra 1")
        }
        
    }
}

struct Perra_swift_Previews: PreviewProvider {
    static var previews: some View {
        Perra_swift()
    }
}

struct Perra2: View {
    var body: some View {
        VStack {
            Text("Hola Perra")
        }
        .navigationTitle("Perra 2")
        
    }
}
