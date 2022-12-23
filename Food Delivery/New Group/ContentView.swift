//
//  ContentView.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State private var isSplashed = false
    @StateObject var appAuthViewModel = AppAuthViewModel()
    
    var body: some View {
        
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {                
                if !isSplashed {
                    SplashScreen(isSplashed: $isSplashed)
                }
                else {
                    if !appAuthViewModel.isLogged() {
                        Login()
                    }
                    else {
                        Main()
                    }
                }
            }
            .environmentObject(appAuthViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
