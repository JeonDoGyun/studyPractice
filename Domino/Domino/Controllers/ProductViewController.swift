//
//  ProductViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

class ProductViewController: BasicViewController {

    let productTableView = UITableView()
    var categoryName: String = ""
    var menuList: [String] = []
    var key: Int = 0
    var price: Int = 0
    
    let image = UIImage(named: "")
    let menuLabel = UILabel()
    let priceLabel = UILabel()
    
    init(row key: Int, categoryName: String) {
        self.key = key
        self.categoryName = categoryName
        super.init(nibName: nil, bundle: nil)
        createMenuList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension ProductViewController {
    private func setUI() {
        view.addSubview(productTableView)
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productTableView.topAnchor.constraint(equalTo: view.topAnchor),
            productTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        let title = menuList[indexPath.row]
        let subtitle = "\(price)원"
        let menuImage = UIImage(named: title)
        cell.imageView?.image = menuImage
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = subtitle
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuName = menuList[indexPath.row]
        let detailVC = DetailViewController(menuName: menuName, price: price)
        SharedData.shared.menuName = menuName
        detailVC.navigationItem.title = menuName
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ProductViewController {
    private func createMenuList() {
        guard let data = Menu.category[key][categoryName],
              let menuList = data["submenu"] as? [String],
              let price = data["price"] as? Int else { return }
        self.menuList = menuList
        self.price = price
    }
}
