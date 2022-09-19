//
//  ViewController.swift
//  UserDefault-Ex
//
//  Created by 전도균 on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension ViewController {
    func save(text: String) {
        UserDefaults.standard.set(text, forKey: "label")
    }
    
    func load() -> String {
        let text = UserDefaults.standard.string(forKey: "label") ?? ""
        return text
    }
}

extension ViewController {
    @objc
    private func didTapButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "텍스트를 입력하세요", preferredStyle: .alert)
        alertController.addTextField()
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { _ in
            guard let text = alertController.textFields?.first?.text else { return }
            self.label.text = text
            self.save(text: text)
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

extension ViewController {
    private func setUI() {
        view.addSubview(label)
        view.addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = load()
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60)
        ])
    }
}

