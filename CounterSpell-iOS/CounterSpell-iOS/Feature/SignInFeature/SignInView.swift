//
//  SignInView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/23/24.
//

import SwiftUI

struct SignInView: View {
    @State private var showError: Bool = false
    @State private var idTextField: String = ""
    @State private var passwordTextField: String = ""
    @State private var isSecure = true
    @State private var showLoading: Bool = false
    @State private var navigateToTabBar: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            if navigateToTabBar {
                TabBarView()
            } else {
                contentView
            }
        }
        .overlay(
            ZStack {
                if showLoading {
                    LoadingView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.4))
                        .edgesIgnoringSafeArea(.all)
                }
            }
        )
    }

    private var contentView: some View {
        VStack(spacing: 0) {

            Image("eee")
                .resizable()
                .frame(width: 200, height: 250)
            SlowalkTextField(
                "아이디를 입력해주세요.",
                text: $idTextField,
                title: "아이디"
            )
            .padding(.horizontal, 10)

            SlowalkTextField(
                "비밀번호를 입력해주세요.",
                text: $passwordTextField,
                title: "비밀번호",
                errorText: "비밀번호를 잘못 입력했습니다.",
                isError: showError,
                eyesState: true,
                isDisabled: false,
                isSecure: $isSecure,
                onSubmit: {
                    if passwordTextField.isEmpty {
                        showError = true
                    } else {
                        showError = false
                    }
                }
            )
            .padding(.horizontal, 10)
            .padding(.top, 19)

            SlowalkButton(
                text: "로그인",
                horizontalPadding: 155,
                verticalPadding: 16,
                backColor: .main,
                actionColor: .main300
            ) {
                handleLogin()
            }
            .padding(.top, 75)

            HStack(spacing: 5) {
                Text("아이디 찾기")
                Text("ㅣ")
                Text("비밀번호 찾기")
                Text("ㅣ")
                Text("회원가입")
            }
            .slowalkFont(.medium, size: 14)
            .slowalkColor(.gray500)
            .padding(.top, 18)

            HStack(spacing: 12) {
                Rectangle()
                    .slowalkColor(.gray500)
                    .frame(width: 100, height: 1)

                Text("소셜 아이디로 간편로그인")
                    .slowalkFont(.medium, size: 12)
                    .slowalkColor(.gray500)

                Rectangle()
                    .slowalkColor(.gray500)
                    .frame(width: 100, height: 1)
            }
            .padding(.top, 86)

            HStack(spacing: 12) {
                Image("naver")
                Image("kakao")
                Image("apple")
            }
            .padding(.top, 28)

            Spacer()
        }
    }

    private func handleLogin() {
        showLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showLoading = false
            withAnimation(nil) { // 애니메이션 없이 상태 전환
                navigateToTabBar = true
            }
        }
    }
}

#Preview {
    SignInView()
}

