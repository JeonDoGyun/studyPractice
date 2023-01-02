//
//  ViewModel.swift
//  DiffableDataSource-EX
//
//  Created by 전도균 on 2023/01/02.
//

import UIKit
import Combine

class ViewModel {
    
    private var dataSource: UITableViewDiffableDataSource<SectionClass, Int>!
    var numbers = [1, 2, 3]
    private var newNumbers = [4, 5, 6]
    let sectionClasses = [SectionClass(name: "1"), SectionClass(name: "2")]
    
    func addNewData() {
        updateSnapshot(items: numbers + newNumbers, section: sectionClasses[1])
    }
    
    private func updateSnapshot(items: [Int], section: SectionClass) {
        var snapshot = NSDiffableDataSourceSnapshot<SectionClass, Int>()
        snapshot.appendSections(sectionClasses)
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    func makeDataSource(tableView: UITableView) {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        dataSource = .init(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
            cell.configure(text: String(itemIdentifier))
            return cell
        })
        updateSnapshot(items: numbers, section: sectionClasses[0])
    }
}

struct SectionClass: Hashable {
    let name: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
