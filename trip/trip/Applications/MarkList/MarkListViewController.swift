//
//  MarkListViewController.swift
//  trip
//
//  Created by 전도균 on 2023/01/22.
// 일기 쓴 것 중 즐겨찾기 표시한 내용들에 대해 따로 모아놓는 곳

import UIKit

class MarkListViewController: UIViewController {
    
    let headerView = UIView()
    let tableView = UITableView()
    
    let convertButton = UIButton(type: .system)
    
    var dataSource: UITableViewDiffableDataSource<Int, String>!
    var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
    
    let sectionArr = [0, 1]
    let textArr = ["abc", "def", "ghi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        setDiffableDataSource()
        updateSnapshot(sectionIdentifiers: sectionArr, itemIdentifiers: textArr)
    }
    
}

extension MarkListViewController {
    private func setUI() {
        view.addSubview(headerView)
        view.addSubview(tableView)
        headerView.addSubview(convertButton)
        
        headerView.backgroundColor = .red
        
        convertButton.backgroundColor = .blue
        convertButton.addTarget(self, action: #selector(didTappedConvertButton(_:)), for: .touchUpInside)
        
        tableView.backgroundColor = .lightGray
        tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        tableView.allowsSelection = false
        tableView.dataSource = self.dataSource
        tableView.delegate = self
    }
    
    private func setConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
            
            convertButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            convertButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            convertButton.widthAnchor.constraint(equalToConstant: 100),
            convertButton.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setDiffableDataSource() {
        dataSource = UITableViewDiffableDataSource<Int, String>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else { fatalError() }
            cell.ellipsisButton.tag = indexPath.row
            return cell
        }
    }
    
    private func updateSnapshot(sectionIdentifiers: [Int], itemIdentifiers: [String]) {
        snapshot.appendSections(sectionIdentifiers)
        snapshot.appendItems(itemIdentifiers)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc
    private func didTappedConvertButton(_ sender: UIButton) {
        let newTextArr = ["gi", "df", "ac"]
        let newSection = [2, 3]
        updateSnapshot(sectionIdentifiers: newSection, itemIdentifiers: newTextArr)
    }
    
    
}

extension MarkListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
