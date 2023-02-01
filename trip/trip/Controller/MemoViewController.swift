//
//  MemoViewController.swift
//  trip
//
//  Created by 전도균 on 2023/02/01.
//

import UIKit

class MemoViewController: UIViewController {
    
    let placeNameLabel = UILabel()
    
    let dateLabel = UILabel()
    
    let imageDescriptionLabel = UILabel()
    
    let descriptionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    private func setUI() {
        [placeNameLabel, dateLabel, imageDescriptionLabel, descriptionLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        
    }

}
