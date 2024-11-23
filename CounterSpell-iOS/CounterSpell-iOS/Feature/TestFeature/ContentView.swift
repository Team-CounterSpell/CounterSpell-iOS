//
//  ContentView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showWebView = false
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    showWebView = true
                } label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }

                NavigationLink(
                    destination: WebViewContainer(urlToLoad: "https://helpful-cactus-6dd5e8.netlify.app/"),
                    isActive: $showWebView
                ) {
                    EmptyView()
                }


            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
