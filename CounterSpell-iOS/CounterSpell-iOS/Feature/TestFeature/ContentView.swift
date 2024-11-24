//
//  ContentView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/22/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true // SplashView를 제어하는 상태 변수

    var body: some View {
        Group {
            if showSplash {
                SplashView()
            } else {
                SignInView()
            }
        }
        .onAppear {
            // 2초 후에 SplashView를 종료
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut) {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
