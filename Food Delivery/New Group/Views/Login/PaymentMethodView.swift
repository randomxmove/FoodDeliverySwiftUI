//
//  PaymentMethodView.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI

struct PaymentMethodView: View {
    @EnvironmentObject var loginVM: LoginStateViewModel
    @State private var temp = ""
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            BackgroundPattern(1)
            VStack (alignment: .leading){
                FDButton(color: "Button-Orange", image: "icon_back", width: 45, height: 45, action: { loginVM.loginState = .fillUpBio})
                Text("Payment Method").modifier(Title1Modifier())
                Text("This data will be displayed in your account profile for security").modifier(CaptionModifier()).frame(width: 240)
                
                FDButton(color: "Button-Gray", image: "paypal", width: 375, height: 75, action: {}).padding(.bottom, 5)
                FDButton(color: "Button-Gray", image: "visa", width: 375, height: 75, action: {}).padding(.bottom, 5)
                FDButton(color: "Button-Gray", image: "payoneer", width: 375, height: 75, action: {}).padding(.bottom, 5)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            BottomButton(text: "Next", action: { loginVM.loginState = .success })
        }
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    @ObservedObject static var appState = AppState()
    
    static var previews: some View {
        PaymentMethodView()
            .environmentObject(appState)
    }
}

