//
//  ConfigViewController.swift
//  Signage
//
//  Created by Sean Roehnelt on 1/10/23.
//

import UIKit
import Kingfisher

class ConfigViewController: UIViewController {
    @IBOutlet weak var imageUrlTextField: UITextField!
    @IBOutlet weak var loadImageButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageUrlTextField.text = "http://tinyurl.com/hatchtv"
    }

    @IBAction func loadAndDisplayImage() {
        guard let href = imageUrlTextField.text, let imageUrl = URL(string: href) else {
            return
        }


        let imageVC = ImageDisplayViewController()
        self.navigationController?.pushViewController(imageVC, animated: true)

        imageVC.imageUrl = imageUrl

//        let url = URL(string: "https://example.com/image.png")
//        imageView.kf.setImage(with: url)
    }
}
