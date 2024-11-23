//
//  WebView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/22/24.
//

import SwiftUI
import WebKit
import AVFoundation

struct WebView: UIViewRepresentable {
    var urlToLoad: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        if #available(iOS 10.0, *) {
            config.mediaTypesRequiringUserActionForPlayback = []
        }

        let contentController = WKUserContentController()
        contentController.add(context.coordinator, name: "openCamera") // 메시지 핸들러 추가
        config.userContentController = contentController

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator

        if let url = URL(string: self.urlToLoad) {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: WebView
        var imagePicker: UIImagePickerController?
        var webView: WKWebView?

        init(_ parent: WebView) {
            self.parent = parent
            super.init()
        }

        // JavaScript로부터 메시지를 수신
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "openCamera" {
                openCamera()
            }
        }

        // 네이티브 카메라 열기
        func openCamera() {
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                sendErrorToWebView(message: "카메라가 지원되지 않는 기기입니다.")
                return
            }

            imagePicker = UIImagePickerController()
            imagePicker?.sourceType = .camera
            imagePicker?.delegate = self
            imagePicker?.cameraCaptureMode = .photo

            if let rootVC = UIApplication.shared.windows.first?.rootViewController {
                rootVC.present(imagePicker!, animated: true, completion: nil)
            }
        }

        // UIImagePickerControllerDelegate 메서드 - 촬영 완료 시 호출
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[.originalImage] as? UIImage {
                sendImageToWebView(image: image)
            }
        }

        // UIImagePickerControllerDelegate 메서드 - 촬영 취소 시 호출
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
            sendErrorToWebView(message: "카메라 사용이 취소되었습니다.")
        }

        // 웹뷰로 이미지 전송
        func sendImageToWebView(image: UIImage) {
            guard let webView = webView else { return }
            if let imageData = image.jpegData(compressionQuality: 0.8) {
                let base64String = imageData.base64EncodedString()
                let jsCode = "displayImage('data:image/jpeg;base64,\(base64String)')"
                DispatchQueue.main.async {
                    webView.evaluateJavaScript(jsCode, completionHandler: nil)
                }
            }
        }

        // 웹뷰로 에러 메시지 전송
        func sendErrorToWebView(message: String) {
            let jsCode = "displayError('\(message)')"
            DispatchQueue.main.async {
                self.webView?.evaluateJavaScript(jsCode, completionHandler: nil)
            }
        }

        // 웹뷰 로드 완료 시 웹뷰 참조 저장 및 카메라 자동 호출
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.webView = webView
            
        }

        // 네이티브 카메라 자동 호출 함수
        func callNativeCamera() {
            DispatchQueue.main.async {
                self.openCamera()
            }
        }
    }
}

struct WebViewContainer: View {
    var urlToLoad: String

    var body: some View {
        WebView(urlToLoad: urlToLoad)
            .navigationBarBackButtonHidden(true)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebViewContainer(urlToLoad: "https://your-secure-website.com/index.html")
    }
}
