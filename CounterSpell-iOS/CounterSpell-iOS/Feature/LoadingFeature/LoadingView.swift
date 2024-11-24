//
//  LoadingView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/24/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        GIFImageView(gifName: "runninggif")
            .frame(width: 200, height: 200)
    }
}


#Preview {
    LoadingView()
}
