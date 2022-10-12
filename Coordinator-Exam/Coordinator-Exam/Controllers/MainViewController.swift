//
//  MainViewController.swift
//  Coordinator-Exam
//
//  Created by 전도균 on 2022/10/12.
//

import UIKit

protocol MainViewControllerDelegate {
    func logout()
}

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barButtonItem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(didTapLogoutButton(_:)))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc
    func didTapLogoutButton(_ sender: UIBarButtonItem) {
        delegate?.logout()
    }
}
