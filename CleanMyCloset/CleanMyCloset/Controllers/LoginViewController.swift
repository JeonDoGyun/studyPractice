//
//  LoginViewController.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/09/25.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let idLabel = UILabel()
    let passwordLabel = UILabel()
    let signInButton = UIButton(type: .system)
    let signUpButton = UIButton(type: .system)
    let emailTextField = UITextField()
    let passwordTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension LoginViewController {
    private func setUI() {
        view.backgroundColor = .white
        
        [signInButton, emailTextField, passwordTextField, idLabel, passwordLabel, signUpButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        idLabel.text = "이메일"
        passwordLabel.text = "비밀번호"
        
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 4
        
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 4
        
        signInButton.setTitle("로그인", for: .normal)
        signInButton.backgroundColor = .systemBlue
        signInButton.tintColor = .white
        signInButton.addTarget(self, action: #selector(didTapSignInButton(_:)), for: .touchUpInside)
        
        signUpButton.setTitle("이메일이 없으신가요?", for: .normal)
        signUpButton.setUnderline()
        signUpButton.backgroundColor = .white
        signUpButton.tintColor = .black
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            idLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idLabel.widthAnchor.constraint(equalToConstant: 60),
            idLabel.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLabel.widthAnchor.constraint(equalToConstant: 60),
            passwordLabel.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.centerYAnchor.constraint(equalTo: idLabel.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 100),
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 180),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension LoginViewController {
    @objc
    private func didTapSignInButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc
    private func didTapSignUpButton(_ sender: UIButton) {
        let signUpVC = SignUpViewController()
//        signUpVC.navigationItem.title = "회원가입"
//        navigationController?.pushViewController(signUpVC, animated: true)
        present(signUpVC, animated: true)
    }
}

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue], range: NSRange(location: 0, length: title.count))
        setAttributedTitle(attributedString, for: .normal)
    }
}
