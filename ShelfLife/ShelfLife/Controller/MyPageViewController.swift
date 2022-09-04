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
            nickName = "\(newValue)"
        }
    }
    let myPageCategories = ["정보 수정", "메모하기"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
        let memoVC = MemoViewController()
        
        switch indexPath.row {
        case 0: present(editVC, animated: true)
        case 1: present(memoVC, animated: true)
        default:
            fatalError()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
