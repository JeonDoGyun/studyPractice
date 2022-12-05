//
//  ImageViewController.swift
//  DrawTest
//
//  Created by 전도균 on 2022/12/05.
//

import UIKit

class ImageViewController: UIViewController {
    
    let imageV = UIImageView()
    var drawImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageV)
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.image = drawImage
        
        NSLayoutConstraint.activate([
            imageV.topAnchor.constraint(equalTo: view.topAnchor),
            imageV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
