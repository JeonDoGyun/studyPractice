//
//  ProductViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

protocol CategoryToProductDelegate: AnyObject {
    func sendData(product: String, productArray: Array<String>)
}

class ProductViewController: UIViewController {

    let productTableView = UITableView()
    var products: [String] = []
    
    let image = UIImageView()
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
        productTableView.backgroundColor = .blue
        
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension ProductViewController: UITableViewDelegate {
    
}
