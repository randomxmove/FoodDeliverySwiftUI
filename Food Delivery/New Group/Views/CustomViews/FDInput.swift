//
//  FDInput.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/20/22.
//

import SwiftUI

struct FDInput: View {
    
    @Binding var input: String
    @State var placeholder = "Username"
    @State var isSecured = false
    @State var showSecuredText = false
    var body: some View {
        VStack {
            if(isSecured) {
                if(!showSecuredText) {
                    HStack {
                        SecureField("", text: $input)
                            .modifier(PlaceholderStyle(showPlaceHolder: input.isEmpty, placeholder: self.placeholder))
                            .foregroundColor(Color.white.opacity(0.3))
                            .padding([.leading, .trailing], 40)
                            .padding([.top,.bottom], 15)
                        Image(showSecuredText ? "eye_show" : "eye_hide")
                            .offset(x: -20)
                            .onTapGesture {
                                showSecuredText = true
                            }
                    }
                }
                else {
                    HStack {
                        TextField("", text: $input)
                            .modifier(PlaceholderStyle(showPlaceHolder: input.isEmpty, placeholder: self.placeholder))
                            .foregroundColor(Color.white.opacity(0.3))
                            .padding([.leading, .trailing], 40)
                            .padding([.top,.bottom], 15)
                        
                        Image(showSecuredText ? "eye_show" : "eye_hide")
                            .offset(x: -20)
                            .onTapGesture {
                                showSecuredText = false
                            }
                    }
                }
            }
            else {
                TextField("", text: $input)
                    .modifier(PlaceholderStyle(showPlaceHolder: input.isEmpty, placeholder: self.placeholder))
                    .foregroundColor(Color.white.opacity(0.3))
                    .padding([.leading, .trailing], 40)
                    .padding([.top,.bottom], 15)
            }
        }
        .frame(width: 375, height: 60, alignment: .center)
        .background(Color("Button-Gray"))
        .cornerRadius(15)
        .padding(5)
    }
}
