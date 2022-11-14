//
//  RegisterViewController.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/11/01.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let imageView = UIImageView() // 사진 어떤거?
    let tagLabel = UILabel() // tag 적는 부분 제목
    let descriptionLabel = UILabel() // 설명 적는 부분 제목
    let descriptionTextField = UITextField() // 설명
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAttributes()
    }
    
}

extension RegisterViewController {
    private func setUI() {
        view.backgroundColor = .white
        [tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RegisterTableViewCell.self, forCellReuseIdentifier: RegisterTableViewCell.identifier)
    }
    
    private func setAttributes() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension RegisterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier, for: indexPath) as? RegisterTableViewCell else { fatalError() }
        
        
        return cell
    }
}

extension RegisterViewController: UITableViewDelegate {
    
}
