//
//  SlowalkButton.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/23/24.
//

import SwiftUI

public struct SlowalkButton: View {
    var text: String
    var horizontalPadding: CGFloat
    var verticalPadding: CGFloat
    var backColor: Color
    var actionColor: Color
    var action: () -> Void

    @State private var isPressed = false

    public init(
        text: String,
        horizontalPadding: CGFloat = 16,
        verticalPadding: CGFloat = 8,
        backColor: Color,
        actionColor: Color,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.backColor = backColor
        self.actionColor = actionColor
        self.action = action
    }

    public var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(text)
                .slowalkColor(.white)
                .slowalkFont(.bold, size: 16)
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isPressed ? actionColor : backColor)
                )
                .scaleEffect(isPressed ? 0.9 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in self.isPressed = true }
                .onEnded { _ in
                    self.isPressed = false
                    self.action()
                }
        )
    }
}
