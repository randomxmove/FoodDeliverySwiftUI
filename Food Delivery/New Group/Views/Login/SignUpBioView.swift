//
//  SignUpBioView.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI

struct SignUpBioView: View {
    @EnvironmentObject var loginVM: LoginStateViewModel
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var contactNumber = ""    
    
    var body: some View {
        
        ZStack {
            Color("Background").ignoresSafeArea()
            Image("bgpattern1")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            VStack (alignment: .leading){
                FDButton(color: "Button-Orange", image: "icon_back", width: 45, height: 45, action: { loginVM.loginState = .signUp })
                Text("Fill in your bio to get stared").modifier(Title1Modifier())
                Text("This data will be displayed in your account profile for security").modifier(CaptionModifier())
                    .frame(width: 240)
                FDInput(input: $firstName, placeholder: "First Name")
                FDInput(input: $lastName, placeholder: "Last Name")
                FDInput(input: $contactNumber, placeholder: "Mobile Number")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            BottomButton(text: "Next", action: { loginVM.loginState = .paymentMethod })
        }
    }
}

struct SignUpBioView_Previews: PreviewProvider {
    @ObservedObject static var appState = AppState()
    
    static var previews: some View {
        SignUpBioView()
            .environmentObject(appState)
    }
}
