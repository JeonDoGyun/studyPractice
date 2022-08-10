//
//  ViewController.swift
//  practice_login
//
//  Created by 전도균 on 2022/08/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginLabel = UILabel()
    
    let idInputView = InputView(type: .id)
    let passwordInputView = InputView(type: .password)
    
    let loginButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.text = "로그인"
        loginLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        loginButton.setTitle("로그인", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 4
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
        
        view.addSubview(loginLabel)
        view.addSubview(idInputView)
        view.addSubview(loginButton)
        view.addSubview(passwordInputView)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        idInputView.translatesAutoresizingMaskIntoConstraints = false
        passwordInputView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            idInputView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40),
            idInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordInputView.topAnchor.constraint(equalTo: idInputView.bottomAnchor, constant: 12),
            passwordInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: passwordInputView.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 68)
            
        ])
    }
    
    @objc
    func didTapLoginButton(_ sender: UIButton) {
        guard let id = idInputView.text,
              let password = passwordInputView.text else { return }
        LoginManager().check(id: id, password: password) ? login() : presentAlertController()
    }
    
    func login() {
        present(HomeViewController(), animated: true)
    }

    func presentAlertController() {
        let alerController = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호를 확인하세요", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        alerController.addAction(confirmAction)
        present(alerController, animated: true)
    }

}
