//
//  CategoryViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

class CategoryViewController: BasicViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let logoImage = UIImageView(image: UIImage(named: "logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension CategoryViewController {
    private func setUI() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.tableHeaderView = logoImage
        
        logoImage.contentMode = .scaleAspectFit
        logoImage.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           
        ])
    }
}

extension CategoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell,
              let imageName = Menu.category[indexPath.row].keys.first?.description else { fatalError() }
        cell.image.image = UIImage(named: imageName)
        cell.selectionStyle = .none
        return cell
    }
}

extension CategoryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let categoryName = Menu.category[indexPath.row].keys.first?.description else { return }
        let productVC = ProductViewController(row: indexPath.row, categoryName: categoryName)
        SharedData.shared.categoryName = categoryName
        productVC.navigationItem.title = categoryName
        navigationController?.pushViewController(productVC, animated: true)
        
    }
}
