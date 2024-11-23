//
//  TabBarView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/22/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            WebView(urlToLoad: "https://oecook.netlify.app/")
                .navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(selectedTab == 1 ? "1map" : "map")
                    Text("지도")
                }
                .tag(1)

            WebView(urlToLoad: "https://helpful-cactus-6dd5e8.netlify.app/")
                .navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(selectedTab == 2 ? "1homs" : "homs")
                    Text("홈")
                }
                .tag(2)

            MyPageView()
                .tabItem {
                    Image(selectedTab == 3 ? "1mye" : "mye")
                    Text("마이")
                }
                .tag(3)
        }
        .accentColor(.black)
    }
}

#Preview {
    TabBarView()
}
