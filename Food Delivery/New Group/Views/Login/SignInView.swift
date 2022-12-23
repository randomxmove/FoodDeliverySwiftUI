//
//  SignInView.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var loginVM: LoginStateViewModel
    @State private var username: String = ""
    @State private var password: String = "";
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            BackgroundPattern(0)
            
            Image("logo")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            VStack {
                Text("Login To Your Account").modifier(Title2Modifier())
                FDInput(input: $username, placeholder: "Username")
                FDInput(input: $password, placeholder: "Password", isSecured: true)
                Text("Or Continue With").modifier(StrongModifier())
                
                HStack {
                    FDButton(color: "Button-Gray", text: "Facebook", image: "facebook", action: {})
                    FDButton(color: "Button-Gray", text: "Google", image: "google", action: {})
                }
                
                FDLink(text: "Forgot Your Password?", action: { loginVM.loginState = .resetPassword }).padding(.top)
                FDLink(text: "Sign up", action: { loginVM.loginState = .signUp }).padding([.top, .bottom])
            }
            .offset(y: 75)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.keyboard)
            
            BottomButton(text: "Login", action: {  })
        }
    }
}

struct SignInView_Previews: PreviewProvider {
   
    @ObservedObject static var appState = AppState()
    
    static var previews: some View {
        SignInView()
            .environmentObject(appState)
    }
}
