//
//  CustomTableViewCell.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    let picture = UIImageView()
    let label = UILabel()
    let editButton = UIButton(type: .system)
    let deleteButton = UIButton(type: .system)

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        setLayout()
    }

}

extension CustomTableViewCell {
    private func setUI() {
        self.backgroundColor = .lightGray
        picture.backgroundColor = .red
        label.backgroundColor = .blue
        
        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editButton.addTarget(self, action: #selector(didTapEditButton(_:)), for: .touchUpInside)
        
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
        
        [picture, label, editButton, deleteButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: contentView.topAnchor),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picture.widthAnchor.constraint(equalToConstant: 160),
            picture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            label.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: picture.trailingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            editButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10),
            editButton.widthAnchor.constraint(equalToConstant: 30),
            editButton.heightAnchor.constraint(equalToConstant: 30),
            
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deleteButton.widthAnchor.constraint(equalToConstant: 30),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}

extension CustomTableViewCell {
    @objc
    private func didTapEditButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc
    private func didTapDeleteButton(_ sender: UIButton) {
        print(#function)
    }
}
