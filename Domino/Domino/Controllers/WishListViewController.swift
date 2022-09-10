//
//  WishListViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

class WishListViewController: UIViewController {
    
    let tableView = UITableView()
    var products: [String] = []
    var counts: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        print(products)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let detailVC = DetailViewController()
        detailVC.delegate = self
        
    }
}

extension WishListViewController: DetailToWishListDelegate {
    func sendData(productName: String, count: String) {
        let detailVC = DetailViewController()
        products.append(detailVC.productName)
        counts.append(String(detailVC.count))
    }
    
}

extension WishListViewController {
    private func setUI() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
                
        navigationItem.title = "Wish List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "목록 지우기", style: .plain, target: self, action: #selector(didTapLeftBarbutton(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(didTapRightBarbutton(_:)))
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension WishListViewController {
    @objc
    private func didTapLeftBarbutton(_ sender: UIBarButtonItem) {
        print(#function)
    }
    
    @objc
    private func didTapRightBarbutton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "결제내역", message: "", preferredStyle: .alert)
        let backAlertAction = UIAlertAction(title: "돌아가기", style: .cancel)
        let buyAlertAction = UIAlertAction(title: "주문", style: .default) { _ in
            
        }
        alert.addAction(backAlertAction)
        alert.addAction(buyAlertAction)
        present(alert, animated: true)
    }
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
//        cell.imageView?.image = UIImage(named: "\(products[indexPath.row])")
//        cell.textLabel?.text = "\(products[indexPath.row])"
//        cell.detailTextLabel?.text = "주문수량 : \(counts[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension WishListViewController: UITableViewDelegate {
    
}
