//
//  Login.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI

struct Login_Previews: PreviewProvider {
    
    @ObservedObject static var appState = AppState()
    @StateObject static var appAuth = AppAuthViewModel()
    
    static var previews: some View {
        Login()
            .environmentObject(appState)
            .environmentObject(appAuth)
    }
}

class LoginStateViewModel: ObservableObject {
    @Published var loginState: LoginState
    
    init() {
        loginState = LoginState.signIn
    }
}

struct Login: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var appAuth: AppAuthViewModel
    
    @StateObject private var viewModel = LoginStateViewModel()
    
    @State var current: Int = 0
    
    var body: some View {
        
        Group {
            switch viewModel.loginState {
                case .signIn: SignInView()
                case .signUp: SignUpView()
                case .fillUpBio: SignUpBioView()
                case .paymentMethod: PaymentMethodView()
                case .success: AccountCreatedView()
                case .resetPassword: ResetPasswordView()
            }
        }
        .environmentObject(viewModel)
    }
    
}
