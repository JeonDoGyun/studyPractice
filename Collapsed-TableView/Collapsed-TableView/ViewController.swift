//
//  ViewController.swift
//  Collapsed-TableView
//
//  Created by 전도균 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    let tableViewData = [
        ["1", "2", "3", "4", "5"],
        ["1", "2", "3", "4", "5"],
        ["1", "2", "3", "4", "5"],
        ["1", "2", "3", "4", "5"],
        ["1", "2", "3", "4", "5"],
    ]
    
    var hiddenSections = Set<Int>() // 이 경우 array보다 set이 더 빠른 경우임. 똑같은 숫자가 들어올 일이 없기 때문에.

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }


}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hiddenSections.contains(section) ? 0 : tableViewData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = tableViewData[indexPath.section][indexPath.row]
        cell.contentConfiguration = config
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.setTitle(String(section), for: .normal)
        button.backgroundColor = .systemBlue
        button.tag = section
        button.addTarget(self, action: #selector(didTapSection(_:)), for: .touchUpInside)
        return button
    }
}

extension ViewController {
    private func setUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController {
    @objc
    func didTapSection(_ sender: UIButton) {
        let section = sender.tag
//        var indexPaths = [IndexPath]()
//        for row in tableViewData[section].indices {
//            let indexPath = IndexPath(row: row, section: section)
//            indexPaths.append(indexPath)
//        }
        let indexPaths = tableViewData[section].indices.map { IndexPath(row: $0, section: section) }
        hiddenSections.contains(section) ? showSection(section, indexPaths) : hideSection(section, indexPaths)
    }
    
    func hideSection(_ section: Int, _ indexPaths: [IndexPath]) {
        hiddenSections.insert(section)
        tableView.deleteRows(at: indexPaths, with: .fade)
    }
    
    func showSection(_ section: Int, _ indexPaths: [IndexPath]) {
        hiddenSections.remove(section)
        tableView.insertRows(at: indexPaths, with: .fade)
    }
}
