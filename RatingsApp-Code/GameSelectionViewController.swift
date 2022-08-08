//
//  GameSelectionController.swift
//  RatingsApp-Code
//
//  Created by 전도균 on 2022/08/08.
//

import UIKit

class GameSelectionViewController: UIViewController {
    
    let tableView = UITableView()
    let games = ["Angry Bird", "Chess", "Russian Rullet", "Spin the Bottle", "Texas Hold'em Poker", "Tic-Tac-Toe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.isScrollEnabled = false // 드래그 막는 법
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

}

// MARK: - UITableViewDataSource
extension GameSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = games[indexPath.row]
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        
        return cell
//        if indexPath.row == 1 {
//            cell.accessoryType = .checkmark
//        }
    }
}

extension GameSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) // cell 가져오기
        cell?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) // cell 가져오기
        cell?.accessoryType = .none
    }
    
}
