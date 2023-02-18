//
//  TileView.swift
//  trip
//
//  Created by 전도균 on 2023/02/15.
//

import UIKit

class TileView: UIViewController {
    
    let label = UILabel()
    
    init(_ text: String) {
        super.init(nibName: nil, bundle: nil)
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setUI()
        setConstraints()
    }
}

extension TileView {
    private func setUI() {
        view.addSubview(label)
        
    }
    
    private func setConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
