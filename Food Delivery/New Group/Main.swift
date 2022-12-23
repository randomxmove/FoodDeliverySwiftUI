//
//  MainScreen.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainPreviews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
