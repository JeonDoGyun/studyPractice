//
//  AddPlayerViewController.swift
//  RatingsApp-Code
//
//  Created by 전도균 on 2022/08/01.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    // 쓰기 바로 직전으로 시점을 이동시켜서 해결
    lazy var cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                              target: self,
                                              action: #selector(didTapBarButtonItem(_:)))
    lazy var doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                              target: self,
                                              action: #selector(didTapBarButtonItem(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Player"
        
        cancelBarButtonItem.tag = 0
        
        
        doneBarButtonItem.tag = 1
        
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.rightBarButtonItem = doneBarButtonItem
        
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0,
                                 width: view.frame.width,
                                 height: view.frame.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AddPlayerTextFieldTableViewCell.self,
                           forCellReuseIdentifier: AddPlayerTextFieldTableViewCell.identifier)
        //
    }
    
    @objc
    func didTapBarButtonItem(_ sender: UIBarButtonItem){
        switch sender {
        case cancelBarButtonItem:
            print("cancel")
        case doneBarButtonItem:
            print("done")
        default:
            fatalError()
        }
    }
}

extension AddPlayerViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2 // section 갯수
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Player Name"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1 // row 갯수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddPlayerTextFieldTableViewCell.identifier, for: indexPath) as? AddPlayerTextFieldTableViewCell else {
            fatalError()
        }
            return cell
        } else {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
            var content = cell.defaultContentConfiguration()
            content.text = "Game"
            content.secondaryText = "Detail"
            content.secondaryTextProperties.color = .black
            content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 14)
            cell.contentConfiguration = content
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }
    }
}

extension AddPlayerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // didSelectRowAt 눌렀을 때 이벤트 발생
        print(indexPath.section)
        guard indexPath.section == 1 else { return }
        let nextVC = GameSelectionViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
