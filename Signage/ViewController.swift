//
//  ViewController.swift
//  Signage
//
//  Created by Sean Roehnelt on 1/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var authButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func authorize() {
        let matchUserName = "aaron"
        let matchPassword = "titanium"

        if userName.text == matchUserName && passwordField.text == matchPassword {
            let configViewController = UIStoryboard(name: "Config", bundle: nil).instantiateInitialViewController()

            if let configViewController = configViewController {
                navigationController?.pushViewController(configViewController, animated: true)
            }
        }
    }
}
