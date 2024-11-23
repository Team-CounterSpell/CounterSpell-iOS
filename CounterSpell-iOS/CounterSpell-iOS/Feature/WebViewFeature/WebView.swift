//
//  WebView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/22/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var urlToLoad: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }

        let webView = WKWebView()

        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {

    }
}

struct WebViewContainer: View {
    var urlToLoad: String

    var body: some View {
        WebView(urlToLoad: urlToLoad)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WebViewContainer(urlToLoad: "https://www.google.com")
}
