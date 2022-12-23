//
//  ResetPasswordView.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var loginVM: LoginStateViewModel
    @State private var password: String = ""
    @State private var checkPassword: String = ""
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            Image("bgpattern1")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            VStack (alignment: .leading){
                FDButton(color: "Button-Orange", image: "icon_back", width: 45, height: 45, action: { loginVM.loginState = .signIn })
                Text("Reset your password here").modifier(Title1Modifier())
                Text("Select which contact details should we use to reset your password").modifier(CaptionModifier())
                    .frame(width: 240)
                    .padding(.bottom, 25)
                
                FDInput(input: $password, placeholder: "New Password", isSecured: true)
                FDInput(input: $checkPassword, placeholder: "Confirm Password", isSecured: true)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            BottomButton(text: "Next", action: { loginVM.loginState = .success })
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    @ObservedObject static var appState = AppState()
    
    static var previews: some View {
        ResetPasswordView()
            .environmentObject(appState)
    }
}

