//
//  DesignTestView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/23/24.
//

import SwiftUI

struct DesignTestView: View {
    var body: some View {
        VStack {

            Text("안녕하세요!")
                .slowalkFont(.semibold, size: 30)

            Text("안녕하세요!")
                .slowalkFont(.bold, size: 30)

            Text("안녕하세요!")
                .slowalkFont(.thin, size: 30)
        }
    }
}

#Preview {
    DesignTestView()
}
