//
//  SecondViewController.swift
//  Delegate-Example
//
//  Created by 전도균 on 2022/08/22.
//

import UIKit

protocol SecondeViewControllerDelegate: AnyObject {
    func didDismissed(text: String)
}

class SecondViewController: UIViewController {
    
    let label = UILabel()
    
    weak var delegate: SecondeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setUI()
    }
    
    deinit {
        DataManager.shared.text = "Dismissed"
        delegate?.didDismissed(text: "")
    }

}

extension SecondViewController {
    func setUI() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

