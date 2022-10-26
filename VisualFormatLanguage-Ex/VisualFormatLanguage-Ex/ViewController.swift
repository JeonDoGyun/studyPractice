//
//  ViewController.swift
//  VisualFormatLanguage-Ex
//
//  Created by 전도균 on 2022/10/26.
//

import UIKit

class ViewController: UIViewController {
    
    private let redView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        let views: [String: Any] = ["R": redView]
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[R]-|",
                                       metrics: nil,
                                       views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[R]-30-|",
                                       metrics: nil,
                                       views: views)
        view.addConstraints(constraints)
    }
}

