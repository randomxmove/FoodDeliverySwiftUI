//
//  SplashScreen.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/23/22.
//

import SwiftUI

class OnboardNavigationModel: ObservableObject {
    @Published var selectionPath = [OnboardState]()
    
    func gotoRoot() {
        selectionPath = []
    }
    
    func goBack() {
        selectionPath.removeLast()
    }
}

enum OnboardState: Hashable {
    case getstart1
    case getstart2
}

struct SplashScreen: View {
    @State private var logoSize = 0.8
    @State private var logoOpacity = 1.0
    
    @Binding var isSplashed: Bool
    @StateObject private var vm = OnboardNavigationModel()
    @State var showInfo = true
    
    var body: some View {
        VStack {
            NavigationStack(path: $vm.selectionPath) {
                splash
                    .navigationDestination(for: OnboardState.self) { state in
                        switch state {
                        case .getstart1 :
                            GetStartedView(isSplashed: $isSplashed, state: state)
                        case .getstart2:
                            GetStartedView(isSplashed: $isSplashed, state: state)
                        }
                    }
            }
            .environmentObject(vm)
        }
    }
    
    var splash: some View {
        VStack {
            Image("bgpattern")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Image("logo")
                    .offset(y: -20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scaleEffect(logoSize)
            .opacity(logoOpacity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    if showInfo {
                        vm.selectionPath.append(.getstart1)
                    }
                    else {
                        isSplashed = true
                    }
                }
                //                withAnimation(.easeIn(duration: 1.5)) {
                //                    self.logoSize = 1
                //                    self.logoOpacity = 1.0
                //                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    @State private static var isSplashed = false
    static var previews: some View {
        SplashScreen(isSplashed: $isSplashed)
    }
}

