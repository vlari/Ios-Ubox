//
//  TTextField.swift
//  ParcelApp
//
//  Created by Obed Garcia on 7/6/22.
//

import SwiftUI

struct PTextField: View {
    var icon: String
    var placeHolder: String
    @Binding var textValue: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .padding(.horizontal)
                .foregroundColor(Color.theme.purple)
                
            TextField(placeHolder, text: $textValue)
                .padding(.vertical)
        }
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.theme.lightPurple)
        )
    }
}

struct TTextField_Previews: PreviewProvider {
    static var previews: some View {
        PTextField(icon: "star", placeHolder: "Name", textValue: .constant(""))
    }
}
