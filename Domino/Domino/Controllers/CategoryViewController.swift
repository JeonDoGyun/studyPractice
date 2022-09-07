//
//  CategoryViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let tableView = UITableView()
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
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
        let menu = Category.allCases[indexPath.row]
        cell.image.image = menu.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension CategoryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let count = Category.allCases[indexPath.row]
        print(count)
    }
}
