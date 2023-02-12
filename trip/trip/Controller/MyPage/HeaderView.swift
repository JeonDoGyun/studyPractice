//
//  HeaderView.swift
//  trip
//
//  Created by 전도균 on 2023/02/12.
//

import UIKit

class HeaderView: UIView {
    
    let profileImageView = UIImageView()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    private func setUI() {
        [profileImageView, descriptionLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        profileImageView.backgroundColor = .lightGray
        profileImageView.image = UIImage(systemName: "person.fill")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 40
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = """
추억이 담긴 사진을
프로필에 저장해주세요.
"""
        descriptionLabel.textColor = .gray
        descriptionLabel.sizeToFit()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            descriptionLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            
            
        ])
    }
}
