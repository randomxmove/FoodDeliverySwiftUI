//
//  AccountCreatedView.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI

struct AccountCreatedView: View {
    @EnvironmentObject var loginVM: LoginStateViewModel
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            Image("bgpattern")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image("success")
                Text("Congrats!").modifier(GreenTitleModifier()).padding(.bottom, -15)
                Text("Your Profile Is Ready To Use").modifier(Title1Modifier())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .offset(y: -75)
            
            
            BottomButton(text: "Close", action: { loginVM.loginState = .signIn })
        }
    }
}

struct AccountCreatedView_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreatedView()
    }
}
