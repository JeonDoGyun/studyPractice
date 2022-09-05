//
//  EditViewController.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/04.
//

import UIKit

protocol EditTextFieldDelegate: AnyObject {
    func sendEdittedText(id: String, nickName: String)
}

class EditViewController: UIViewController {
    
    let titleLabel = UILabel()
    let editButton = UIButton(type: .system)
    
    let profile = UIImageView(image: UIImage(systemName: "person.fill"))
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    
    let nickNameLabel = UILabel()
    let nickNameTextField = UITextField()
    
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    
    let phoneLabel = UILabel()
    let phoneTextField = UITextField()
    
    weak var delegate: EditTextFieldDelegate?
    
    static var myEmail = "abcd@google.com" {
        willSet {
            self.myEmail = "\(newValue)"
        }
    }
    static var myPhoneNumber = "010-1234-5678" {
        willSet {
            self.myPhoneNumber = "\(newValue)"
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension EditViewController {
    @objc
    private func didTapEditButton(_ sender: UIButton) {
//        LoginViewController.myId = nameTextField.text ?? ""
//        MyPageViewController.nickName = nickNameTextField.text ?? ""
        EditViewController.myEmail = emailTextField.text ?? "abcd@google.com"
        EditViewController.myPhoneNumber = phoneTextField.text ?? "1234"
        
        guard let id = nameTextField.text else { return }
        guard let nickName = nickNameTextField.text else { return }
        
        delegate?.sendEdittedText(id: id, nickName: nickName)
        
        dismiss(animated: true)
    }
}


extension EditViewController {
    private func setUI() {
        view.backgroundColor = .white
        
        [titleLabel, editButton, profile, nameLabel, nameTextField, nickNameLabel, nickNameTextField, emailLabel, emailTextField, phoneLabel, phoneTextField].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleLabel.text = "정보 수정"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.sizeToFit()
        
        editButton.setTitle("Edit", for: .normal)
        editButton.addTarget(self, action: #selector(didTapEditButton(_:)), for: .touchUpInside)
        
        profile.contentMode = .scaleToFill
        profile.backgroundColor = .lightGray
        profile.layer.cornerRadius = 100 / 2
        profile.clipsToBounds = true
        
        nameLabel.text = "이름"
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.textAlignment = .left
        
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.cornerRadius = 4
        nameTextField.text = "\(LoginViewController.myId)"
        
        nickNameLabel.text = "닉네임"
        nickNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nickNameLabel.textAlignment = .left
        
        nickNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nickNameTextField.layer.borderWidth = 1
        nickNameTextField.layer.cornerRadius = 4
        nickNameTextField.text = "\(MyPageViewController.nickName)"
        
        emailLabel.text = "이메일"
        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        emailLabel.textAlignment = .left
        
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 4
        emailTextField.text = "\(EditViewController.myEmail)"
        
        phoneLabel.text = "휴대폰"
        phoneLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        phoneLabel.textAlignment = .left
        
        phoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.layer.cornerRadius = 4
        phoneTextField.text = "\(EditViewController.myPhoneNumber)"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            profile.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            profile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profile.widthAnchor.constraint(equalToConstant: 100),
            profile.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: profile.bottomAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            nickNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            nickNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nickNameLabel.widthAnchor.constraint(equalToConstant: 100),
            nickNameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            nickNameTextField.topAnchor.constraint(equalTo: nickNameLabel.topAnchor),
            nickNameTextField.leadingAnchor.constraint(equalTo: nickNameLabel.trailingAnchor),
            nickNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nickNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailLabel.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            emailLabel.widthAnchor.constraint(equalToConstant: 100),
            emailLabel.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            phoneLabel.widthAnchor.constraint(equalToConstant: 100),
            phoneLabel.heightAnchor.constraint(equalToConstant: 50),
            
            phoneTextField.topAnchor.constraint(equalTo: phoneLabel.topAnchor),
            phoneTextField.leadingAnchor.constraint(equalTo: phoneLabel.trailingAnchor),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneTextField.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}
