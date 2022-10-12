//
//  LoginViewController.swift
//  Coordinator-Exam
//
//  Created by 전도균 on 2022/10/12.
//

import UIKit

protocol LoginViewControllerDelegate {
    func login()
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barButtonItem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(didTapLoginButton(_:)))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func didTapLoginButton(_ sender: UIBarButtonItem) {
        delegate?.login()
    }
}

