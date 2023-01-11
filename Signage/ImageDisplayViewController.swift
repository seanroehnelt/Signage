//
//  ImageDisplayViewController.swift
//  Signage
//
//  Created by Sean Roehnelt on 1/10/23.
//

import UIKit
import Kingfisher

class ImageDisplayViewController: UIViewController {
    let autoReloadTime: TimeInterval = 60 * 10

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
        KingfisherManager.shared.retrieveImage(with: url, options: [.forceRefresh]) { [weak self] result in
            switch result {
            case .success(let imageResult):
                let image = imageResult.image
                self?.imageView.kf.setImage(with: url, placeholder: image, options: [.cacheMemoryOnly, .transition(.fade(1.0))])
            case .failure(let error):
                print(error)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + autoReloadTime, execute: { [weak self] in
            self?.loadImageForUrl(url)
        })
    }
}
