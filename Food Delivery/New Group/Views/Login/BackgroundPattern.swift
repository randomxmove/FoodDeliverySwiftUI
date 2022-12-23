//
//  BackgroundPattern.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/21/22.
//

import SwiftUI

struct BackgroundPattern: View {
    var patternType = 0
    
    init(_ patternType: Int) {
        self.patternType = patternType
    }
    var body: some View {
        if patternType == 0 {
            Image("bgpattern")
                .resizable()
                .ignoresSafeArea()
        }
        else if patternType == 1{
            Image("bgpattern1")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }        
    }
}
