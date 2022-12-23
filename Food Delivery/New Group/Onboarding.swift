//
//  Splash.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/19/22.
//

import SwiftUI


struct Onboarding: View {
    @EnvironmentObject var appState: AppState
    @State var current: Int = 0
    var body: some View {
        Text("HELLO WORLD")
//        if(current == 0)        {
//                                    SplashView()
//                                        .onAppear {
//                                            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
//                                                withAnimation {
//                                                    self.current = 1
//                                                }
//                                            })
//                                        }
//                                }
//        else if(current == 1)   {   GetStartedView(index: current, action: { updateIndex() })   }
//        else if(current == 2)   {   GetStartedView(index: current, action: { updateIndex() })  }
//        else                    {   VStack {}.onAppear {
//                                        appState.hasOnboarded = true
//                                    }
//                                }
//
    }
    
    func updateIndex() {
        current += 1
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
        Onboarding().previewDevice("iPhone 8")
        Onboarding().previewDevice("iPhone 11 Pro Max")
        
        
    }
}
	


struct GetStartedView: View {
    @EnvironmentObject private var vm: OnboardNavigationModel
    @Binding var isSplashed: Bool
    var state: OnboardState
    
    private let title1 = "Find your Comfort \nFood Here"
    private let title2 = "Food Ninja is Where Your\n Comfort Food Lives"
    
    private let caption1 = "Here You Can find a chef or dish for every taste and color. Enjoy!"
    private let caption2 = "Enjoy a fast and smooth food delivery at your doorstep"
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            GeometryReader { metrics in
                
                VStack (spacing: 0) {
                    Image(state == .getstart1 ? "getstarted1" : "getstarted2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: metrics.size.width, height: metrics.size.height / 1.7)
                    
                    Group {
                            Text(state == .getstart1 ? title1 : title2)
                                .modifier(Title1Modifier())
                                .multilineTextAlignment(.center)
                                .lineSpacing(7)
                                .padding([.leading, .trailing])
                            Text(state == .getstart1 ? caption1 : caption2)
                                .modifier(CaptionModifier())
                                .multilineTextAlignment(.center)
                                .frame(width: metrics.size.width / 1.5)
                    }
                    BottomButton(text: "Next", action: {
                        if state == OnboardState.getstart1 {
                            vm.selectionPath.append(OnboardState.getstart2)
                        }
                        else {
                            isSplashed = true
                        }
                        
                    })
                        .frame(maxHeight: metrics.size.height, alignment: .bottom)
                        .padding(.bottom, 50)
                }
                .frame(maxWidth: .infinity, maxHeight: metrics.size.height, alignment: .top)
            }
        }
    }
    
}

struct SplashView: View {
    
    @State private var logoSize = 0.8
    @State private var logoOpacity = 1.0
    
    var body: some View {
        
        ZStack {
            Color("Background").ignoresSafeArea()
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
//                withAnimation(.easeIn(duration: 1.5)) {
//                    self.logoSize = 1
//                    self.logoOpacity = 1.0
//                }
            }
        }
    }
}
