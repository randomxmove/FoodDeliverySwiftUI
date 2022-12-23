//
//  FDButton.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/20/22.
//

import SwiftUI

struct FDButton: View {
    @State var color = "Button-Green"
    @State var text = ""
    @State var image = ""
    @State var width: CGFloat = 180
    @State var height: CGFloat = 57
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            HStack {
                if(!image.isEmpty) {
                    Image(image)
                        .padding(.trailing, 5)
                }
                if(!text.isEmpty) {
                    Text(text)
                        .font(.custom("BentonSans-Medium", size: 16))
                        .foregroundColor(.white)
                }
            }
            .frame(width: width, height: height)
            .background(Color(color))
            .cornerRadius(15)
        }
    }
}

struct BottomButton: View {
    var text: String = ""
    var color: String = "Button-Green"
    var action: () -> Void
    var body: some View {
        HStack {
            FDButton(color: color, text: text, action: action)
        }
        .frame(maxWidth: .infinity)
        .padding([.top, .bottom], 10)
    }
}
