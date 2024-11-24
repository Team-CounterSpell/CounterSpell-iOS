//
//  SplashView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/24/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            // 아래에서 위로 올라오는 파란색 그라데이션
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue, // 아래쪽 진한 파란색
                    Color.blue.opacity(0.6), // 중간
                    Color.blue.opacity(0.3) // 위쪽 연한 파란색
                ]),
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea() // 화면 전체를 덮음

            // 로고 이미지
            Image("wlogo")
                .padding(.bottom, 120)
        }
    }
}

#Preview {
    SplashView()
}

