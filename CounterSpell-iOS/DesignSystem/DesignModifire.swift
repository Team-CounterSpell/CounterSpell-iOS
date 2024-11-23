//
//  DesignModifire.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/23/24.
//

import SwiftUI

enum FontWeight: String {
    case light = "Pretendard-Light"
    case regular = "Pretendard-Regular"
    case medium = "Pretendard-Medium"
    case semibold = "Pretendard-SemiBold"
    case bold = "Pretendard-Bold"
    case black = "Pretendard-Black"
    case thin = "Pretendard-Thin"
}

struct PretendardFontModifier: ViewModifier {
    var weight: FontWeight
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom(weight.rawValue, size: size))
    }
}

struct AppColor {
    static let gray100 = Color("gray100")
    static let gray200 = Color("gray200")
    static let gray300 = Color("gray300")
    static let gray400 = Color("gray400")
    static let gray500 = Color("gray500")
    static let gray600 = Color("gray600")
    static let gray700 = Color("gray700")
    static let gray800 = Color("gray800")
    static let gray900 = Color("gray900")
    static let main = Color("main")
    static let main100 = Color("main100")
    static let main200 = Color("main200")
    static let main300 = Color("main300")
    static let main400 = Color("main400")
    static let main500 = Color("main500")
    static let main600 = Color("main600")

}


struct PretendardColorModifier: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
    }
}



extension View {
    func slowalkFont(_ weight: FontWeight, size: CGFloat) -> some View {
        self.modifier(PretendardFontModifier(weight: weight, size: size))
    }

    func slowalkColor(_ color: Color) -> some View {
        self.modifier(PretendardColorModifier(color: color))
    }
}
