//
//  MyPageView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/23/24.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("AppLogo")
                .padding(.leading, 21)
                .padding(.top, 33)

            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .padding(.horizontal, 19)
                    .frame(height: 158)
                    .padding(.top, 42)
                    .slowalkColor(.gray10)
                    .shadow(radius: 7)

                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Image("oline")
                            .overlay(
                                Image("logo")
                            )
                            .padding(.bottom, 20)

                        VStack(spacing: 0) {
                            Text("박준원")
                                .slowalkFont(.semibold, size: 20)

                            Text("서울 강동구")
                                .slowalkFont(.medium, size: 12)
                                .slowalkColor(.gray700)
                                .background (
                                    RoundedRectangle(cornerRadius: 999)
                                    .slowalkColor(.gray100)
                                    .frame(width: 71, height: 32)
                                )
                                .padding(.top, 15)
                                .padding(.leading, 13)

                        }
                        .padding(.bottom, 32)
                        .padding(.leading, 5)
                        Spacer()

                        VStack(spacing: 0) {
                            Text("내 포인트")
                                .slowalkFont(.medium, size: 16)
                                .slowalkColor(.gray700)
                                .padding(.top, 10)

                            Text("643 P")
                                .slowalkColor(.people1)
                                .slowalkFont(.medium, size: 20)
                                .padding(.top, 4)
                        }
                        .padding(.bottom, 30)
                        .padding(.trailing, 37)
                    }
                    .padding(.leading, 44)

                    Rectangle()
                        .frame(width: 318,height: 1)
                        .slowalkColor(.gray300)
                        .padding(.leading, 7)

                    HStack(spacing: 0) {
                        Text("프로필 편집")
                            .slowalkFont(.medium, size: 17)
                            .slowalkColor(.gray900)
                            .padding(.leading, 45)
                        Spacer()
                        Image("backbutton")
                            .padding(.trailing, 36)
                    }
                    .padding(.top, 15)

                }
                .padding(.top, 35)
            }

            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .padding(.horizontal, 19)
                    .frame(height: 412)
                    .padding(.top, 25)
                    .slowalkColor(.gray10)
                    .shadow(radius: 7)

                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("교환가능한 상품권")
                            .slowalkFont(.semibold, size: 24)

                        Spacer()

                        Text("7개")
                            .slowalkFont(.medium, size: 12)
                    }
                    .padding(.top, 30)

                    item(image: "icon1", title: "아름다운 가게", moeny: "10000")
                        .padding(.top, 28)
                    item(image: "icon2", title: "공간", moeny: "5000")
                        .padding(.top, 28)
                    item(image: "icon3", title: "아이쿱생협", moeny: "20000")
                        .padding(.top, 28)
                    item(image: "icon4", title: "울림", moeny: "15000")
                        .padding(.top, 28)

                    Rectangle()
                        .frame(width: 318,height: 1)
                        .slowalkColor(.gray300)
                        .padding(.leading, 7)
                        .padding(.top, 24)

                    HStack(spacing: 5) {
                        Text("교환가능한 상품권 더보기")
                            .slowalkFont(.medium, size: 17)
                            .slowalkColor(.gray600)
                            //.padding(.leading, 45)

                        Image("backbutton")
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                    .padding(.top, 16)
                }
                .padding(.leading, 40)
                .padding(.trailing, 37)
            }
            Spacer()
        }
    }
}

@ViewBuilder
func item (
    image: String,
    title: String,
    moeny: String
) -> some View {
    HStack(spacing: 0) {
        Image(image)

        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .slowalkFont(.semibold, size: 16)
                .slowalkColor(.gray900)
            Text("\(moeny)원 상품권")
                .slowalkFont(.medium, size: 14)
                .slowalkColor(.gray400)
                .padding(.top, 4)
        }
        .padding(.leading, 8)
        Spacer()

        Text("교환하기")
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .slowalkFont(.medium, size: 12)
            .slowalkColor(.white)
            .background(.main600)
            .cornerRadius(4)
    }
}

#Preview {
    MyPageView()
}
