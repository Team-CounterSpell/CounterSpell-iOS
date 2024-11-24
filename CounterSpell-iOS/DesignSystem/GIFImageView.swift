//
//  GIFImageView.swift
//  CounterSpell-iOS
//
//  Created by 서지완 on 11/24/24.
//

import UIKit
import ImageIO

extension UIImage {
    static func animatedImage(withAnimatedGIFData data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }

        var images: [UIImage] = []
        var duration: Double = 0

        let count = CGImageSourceGetCount(source)
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let frameDuration = UIImage.frameDuration(for: source, at: i)
                duration += frameDuration
                images.append(UIImage(cgImage: cgImage))
            }
        }

        return UIImage.animatedImage(with: images, duration: duration)
    }

    private static func frameDuration(for source: CGImageSource, at index: Int) -> Double {
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [CFString: Any],
              let gifProperties = properties[kCGImagePropertyGIFDictionary] as? [CFString: Any],
              let delayTime = gifProperties[kCGImagePropertyGIFDelayTime] as? Double else { return 0.1 }

        return delayTime > 0.1 ? delayTime : 0.1
    }
}

import SwiftUI

struct GIFImageView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        // GIF 로드
        if let gifPath = Bundle.main.path(forResource: gifName, ofType: "gif"),
           let gifData = try? Data(contentsOf: URL(fileURLWithPath: gifPath)) {
            imageView.image = UIImage.animatedImage(withAnimatedGIFData: gifData)
        }

        view.addSubview(imageView)

        // 제약 조건으로 크기 조절
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // SwiftUI에서 전달된 크기를 강제로 적용
        if let imageView = uiView.subviews.first as? UIImageView {
            imageView.contentMode = .scaleAspectFit
        }
    }
}


