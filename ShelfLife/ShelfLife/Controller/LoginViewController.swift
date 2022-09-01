//
//  LoginViewController.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/02.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}

extension LoginViewController {
    func setUI() {
        view.backgroundColor = .systemBlue
        view.addSubview(loginLabel)
    }
}
