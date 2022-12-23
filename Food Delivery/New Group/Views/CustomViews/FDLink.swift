//
//  FDLink.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/20/22.
//

import SwiftUI

struct FDLink: View {
    @State var text = ""
    var action: () -> Void
    var body: some View {
        
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            Text(text)
                .font(.custom("BentonSans-Medium", size: 12))
                .underline()
                .foregroundColor(Color("Button-Green"))
        }
    }
}
