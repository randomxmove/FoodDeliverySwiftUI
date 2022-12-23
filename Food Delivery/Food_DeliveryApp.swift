//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI
import Firebase


@main
struct Food_DeliveryApp: App {
    
    init() {
        #if RELEASE
        FirebaseApp.configure()
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
//            NavigationView {
//                if !appState.hasOnboarded {
//                    Onboarding()
//                }
//                else {
//                    Login()
//                }
//            }
//            .environmentObject(appState)
//            .environmentObject(appAuthViewModel)
        }
    }
}
