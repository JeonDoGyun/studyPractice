//
//  ProfileVIew.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/04.
//

import UIKit

class ProfileVIew: UIView {
        
    static let profileImage = UIImageView(image: UIImage(systemName: "person.fill"))
    
    static let nameLabel = UILabel()
    static let nickNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension ProfileVIew {
    private func setUI() {
        [ProfileVIew.profileImage, ProfileVIew.nameLabel, ProfileVIew.nickNameLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        ProfileVIew.profileImage.contentMode = .scaleToFill
        ProfileVIew.profileImage.backgroundColor = .lightGray
        ProfileVIew.profileImage.layer.cornerRadius = 100 / 2
        ProfileVIew.profileImage.clipsToBounds = true
        
        ProfileVIew.nameLabel.text = "이름: \(LoginViewController.myId)"
        ProfileVIew.nameLabel.font = UIFont.systemFont(ofSize: 18)
        ProfileVIew.nameLabel.textAlignment = .left
        
        ProfileVIew.nickNameLabel.text = "닉네임: \(MyPageViewController.nickName)"
        ProfileVIew.nickNameLabel.font = UIFont.systemFont(ofSize: 18)
        ProfileVIew.nickNameLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            ProfileVIew.profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ProfileVIew.profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            ProfileVIew.profileImage.widthAnchor.constraint(equalToConstant: 100),
            ProfileVIew.profileImage.heightAnchor.constraint(equalToConstant: 100),
            
            ProfileVIew.nameLabel.topAnchor.constraint(equalTo: ProfileVIew.profileImage.topAnchor, constant: 25),
            ProfileVIew.nameLabel.leadingAnchor.constraint(equalTo: ProfileVIew.profileImage.trailingAnchor, constant: 30),
//            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            ProfileVIew.nickNameLabel.topAnchor.constraint(equalTo: ProfileVIew.nameLabel.bottomAnchor, constant: 10),
            ProfileVIew.nickNameLabel.leadingAnchor.constraint(equalTo: ProfileVIew.nameLabel.leadingAnchor),
            ProfileVIew.nickNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
