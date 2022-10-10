//
//  ButtonView.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/10.
//

import UIKit

class ButtonView: UIView {
    let editButton = UIButton(type: .system)
    let deleteButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonView {
    private func setUI() {
        [editButton, deleteButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editButton.addTarget(self, action: #selector(didTapEditButton(_:)), for: .touchUpInside)
        
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            editButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10),
            editButton.widthAnchor.constraint(equalToConstant: 20),
            editButton.heightAnchor.constraint(equalToConstant: 20),
            
            deleteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

extension ButtonView {
    @objc
    private func didTapEditButton(_ sender: UIButton) {
        print(#function)
//        delegate?.didTapEditButton(tag: tag)
    }

    @objc
    private func didTapDeleteButton(_ sender: UIButton) {
        print(#function)
//        delegate?.didTapDeleteButton(tag: tag)
    }
}
