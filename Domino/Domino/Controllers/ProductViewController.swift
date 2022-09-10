//
//  ProductViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit



class ProductViewController: UIViewController {

    let productTableView = UITableView()
    var products: [String] = []
    var prices = ""
    
    let image = UIImage(named: "")
    let menuLabel = UILabel()
    let priceLabel = UILabel()
        
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
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.imageView?.image = UIImage(named: products[indexPath.row])
        cell.textLabel?.text = products[indexPath.row]
        cell.detailTextLabel?.text = prices
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.navigationItem.title = products[indexPath.row]
        detailVC.menuImage.image = UIImage(named: "\(products[indexPath.row])")
        detailVC.productName = products[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

