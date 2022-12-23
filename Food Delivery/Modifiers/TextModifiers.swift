//
//  TextModifiers.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/20/22.
//

import Foundation
import SwiftUI

struct CaptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("BentonSans-Book", size: 12))
            .foregroundColor(.white)
            .padding([.top, .bottom])
            .lineSpacing(10)
    }
}

struct StrongModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("BentonSans-Bold", size: 12))
            .foregroundColor(.white)
            .padding([.top, .bottom])
    }
}
struct Title1Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("BentonSans-Bold", size: 25))
            .foregroundColor(.white)
            .padding([.top, .bottom])
    }
}

struct Title2Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("BentonSans-Bold", size: 20))
            .foregroundColor(.white)
            .padding([.top, .bottom])
    }
}

struct GreenTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("BentonSans-Bold", size: 30))
            .foregroundColor(Color("Button-Green"))
            .padding([.top, .bottom])
    }
}

struct HeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("BentonSans-Bold", size: 31))
            .foregroundColor(.white)
            .padding([.top, .bottom])
    }
}
