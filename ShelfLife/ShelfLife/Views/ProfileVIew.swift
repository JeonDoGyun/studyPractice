//
//  ProfileVIew.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/04.
//

import UIKit

class ProfileVIew: UIView {
        
    static let profileImage = UIImageView(image: UIImage(systemName: "person.fill"))
    
    let nameLabel = UILabel()
    let nickNameLabel = UILabel()
    
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
        [ProfileVIew.profileImage, nameLabel, nickNameLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        ProfileVIew.profileImage.contentMode = .scaleToFill
        ProfileVIew.profileImage.backgroundColor = .lightGray
        ProfileVIew.profileImage.layer.cornerRadius = 100 / 2
        ProfileVIew.profileImage.clipsToBounds = true
        
        nameLabel.text = "내 계정: \(LoginViewController.myId)"
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textAlignment = .left
        
        nickNameLabel.text = "닉네임: \(MyPageViewController.nickName)"
        nickNameLabel.font = UIFont.systemFont(ofSize: 18)
        nickNameLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            ProfileVIew.profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ProfileVIew.profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            ProfileVIew.profileImage.widthAnchor.constraint(equalToConstant: 100),
            ProfileVIew.profileImage.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: ProfileVIew.profileImage.topAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: ProfileVIew.profileImage.trailingAnchor, constant: 30),
//            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            nickNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nickNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nickNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
