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

        imageUrlTextField.text = "https://images.squarespace-cdn.com/content/v1/571079941bbee00fd7f0470f/1527169029768-KXVB6JPR9D2RFXNO58VE/Titanium+%282%29.JPG?format=1500w"
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
