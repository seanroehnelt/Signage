//
//  ConfigViewController.swift
//  Signage
//
//  Created by Sean Roehnelt on 1/10/23.
//

import UIKit
import Kingfisher

class ConfigViewController: UIViewController {
    let ImageURLKey = "ImageURL"
    let DefaultImageURL = "http://tinyurl.com/hatchtv"

    @IBOutlet weak var imageUrlTextField: UITextField!
    @IBOutlet weak var loadImageButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let previousImageHref = UserDefaults.standard.value(forKey: ImageURLKey) as? String, let previousImageUrl = URL(string: previousImageHref) {
            imageUrlTextField.text = previousImageUrl.absoluteString
        } else {
            imageUrlTextField.text = DefaultImageURL
        }
    }

    @IBAction func loadAndDisplayImage() {
        guard let href = imageUrlTextField.text, let imageUrl = URL(string: href) else {
            return
        }

        UserDefaults.standard.setValue(imageUrl.absoluteString, forKey: ImageURLKey)

        let imageVC = ImageDisplayViewController()
        self.navigationController?.pushViewController(imageVC, animated: true)

        imageVC.imageUrl = imageUrl
    }
}
