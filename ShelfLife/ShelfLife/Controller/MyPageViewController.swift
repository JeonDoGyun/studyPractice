//
//  MyPageViewController.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/01.
//

import UIKit

class MyPageViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    static var nickName = "개발자가 되자" {
        willSet {
            self.nickName = "\(newValue)"
        }
    }
    let myPageCategories = ["정보 수정"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension MyPageViewController {
    private func setUI() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}

extension MyPageViewController: EditTextFieldDelegate {
    func sendEdittedText(id: String, nickName: String) {
        LoginViewController.myId = id
        MyPageViewController.nickName = nickName
        
        ProfileVIew.nameLabel.text = "이름: \(LoginViewController.myId)"
        ProfileVIew.nickNameLabel.text = "닉네임: \(MyPageViewController.nickName)"
    }
    
}

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
        cell.label.text = myPageCategories[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension MyPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileVIew()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editVC = EditViewController()
        
        switch indexPath.row {
        case 0:
            editVC.delegate = self
            present(editVC, animated: true)
        default:
            fatalError()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
