//
//  ImageDisplayViewController.swift
//  Signage
//
//  Created by Sean Roehnelt on 1/10/23.
//

import UIKit
import Kingfisher

class ImageDisplayViewController: UIViewController {
    private var _imageUrl: URL?
    public var imageUrl: URL? {
        get {
            return _imageUrl
        }

        set {
            _imageUrl = newValue

            if isViewLoaded == true {
                if let url = _imageUrl {
                    loadImageForUrl(url)
                }
            }
        }
    }
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

//    override func loadView() {
//        view.addSubview(imageView)
//        view.addConstraints([
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
//            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        view.addConstraints([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        if let imageUrl = imageUrl {
            loadImageForUrl(imageUrl)
        }
    }

    private func loadImageForUrl(_ url: URL) {
//        let url = URL(string: "https://example.com/image.png")
        imageView.kf.setImage(with: url)
    }
}
