//
//  ViewController.swift
//  DiffableDataSource-EX
//
//  Created by 전도균 on 2023/01/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewModel()
//    private var dataSource: UITableViewDiffableDataSource<SectionClass, Int>! // <Section, Row> / hashable 해야 됨 (유일)
//    var numbers = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.makeDataSource(tableView: tableView)
        tableView.delegate = self
//        setupTableView()
//        updateSnapshot(items: numbers, section: sectionClasses[0])
    }

//    private func setupTableView() {
//        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
//        tableView.delegate = self
//        dataSource = .init(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
//            cell.configure(text: String(itemIdentifier))
//            return cell
//        }) // 타입을 명시한 경우 .init을 누르면 알아서 만들어줌
//    }
    
//    enum Section: CaseIterable { // case에 같은 값을 못 넣으니까 hashable
//        case first
//        case second
//    }
    
//    struct SectionClass: Hashable {
//        let name: String
//
//        func hash(into hasher: inout Hasher) {
//            hasher.combine(name)
//        }
//    }
    
//    let sectionClasses = [SectionClass(name: "1"), SectionClass(name: "2")]
//    
//    private func updateSnapshot(items: [Int], section: SectionClass) {
//        var snapshot = NSDiffableDataSourceSnapshot<SectionClass, Int>()
//        snapshot.appendSections(sectionClasses)
//        snapshot.appendItems(items, toSection: section)
//        dataSource.apply(snapshot)
//    }
}

//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        updateSnapshot(items: [4, 5, 6], section: sectionClasses[1])
//    }
//}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.addNewData()
    }
}
