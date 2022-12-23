//
//  SignUpView.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var loginVM: LoginStateViewModel
    @EnvironmentObject var appAuth: AppAuthViewModel
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = "";
    
    @State private var keepSigned: Bool = false
    @State private var notifyEmail: Bool = false
    
    @StateObject private var user: User = User()

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            Image("bgpattern")
                .resizable()
                .ignoresSafeArea()
            Image("logo")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            VStack {
                Text("Sign Up For Free").modifier(Title2Modifier())
                FDInput(input: $user.username, placeholder: "Username")
                FDInput(input: $email, placeholder: "Email")
                FDInput(input: $password, placeholder: "Password", isSecured: true)
                FDToggle(text:"Keep Me Signed In")
                FDToggle(text:"Email Me About Special Pricing")
                FDLink(text: "already have an account?", action: { loginVM.loginState = .signIn}).padding([.top, .bottom])
                
            }
            .offset(y: 75)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.keyboard)
            
            BottomButton(text: "Create Account", action: {})
        }
    }
    
    func signup() {
        appAuth.register(withEmail: email, password: password)
        loginVM.loginState = .success
    }
}

struct FDToggle: View {
    
    @State var text: String = ""
    var body: some View {
        
        HStack {
            ZStack {
                if(true) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color("Button-Green"))
                        .frame(width: 22, height: 22)
                } else {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("Button-Gray"))
                        .frame(width: 22, height: 22)
                }
            }
            Text(text).modifier(CaptionModifier())
        }
        .frame(maxWidth: .infinity, maxHeight: 25, alignment: .leading)
        .padding(.leading, 20)
    }
}

struct SignUpView_Previews: PreviewProvider {
    @ObservedObject static var appState = AppState()
    
    static var previews: some View {
        SignUpView().environmentObject(appState)
        SignUpView().previewDevice("iPhone 8").environmentObject(appState)
    }
}
