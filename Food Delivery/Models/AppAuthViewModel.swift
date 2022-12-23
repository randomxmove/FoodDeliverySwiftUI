//
//  AppAuthViewModel.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/21/22.
//

import SwiftUI
import Firebase

class AppAuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
#if RELEASE
        self.userSession = Auth.auth().currentUser
#endif
        print("DEBUG: user session is \(userSession)")
    }
    
    func isLogged() -> Bool {
        return userSession != nil
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: login with \(email)")
    }
    
    func register(withEmail email: String, password: String) {
        print("DEBUG: Registered with \(email), \(password)")
    }
}

enum Screen {
    case onboarding, login, main
}

enum LoginState {
    case signIn, signUp, fillUpBio, paymentMethod, success, resetPassword
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
            }
            content
            .foregroundColor(Color.white)
        }
    }
}

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    @Published var loginState: LoginState
    
    init() {
        self.hasOnboarded = false
        self.loginState = .signIn
    }
}
    
