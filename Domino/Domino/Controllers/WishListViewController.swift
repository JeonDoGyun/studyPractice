//
//  WishListViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

class WishListViewController: BasicViewController {
    
    let tableView = UITableView()
    static var products: [String] = []
    static var counts: [Int] = []
    
    var productCount = products.count
    var i = 0
    var message = "결제할 메뉴가 없습니다."
    
    var sum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        message = ""
        while i < WishListViewController.products.count {
            message += "\(WishListViewController.products[i]) - \(WishListViewController.counts[i])개\n"
            sum += WishListViewController.counts[i] * 10000
            i += 1
        }
        message += "결제금액: \(sum)원"
        
        tableView.reloadData()
    }
}

extension WishListViewController {
    private func setUI() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
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
        WishListViewController.products = []
        WishListViewController.counts = []
        message = "결제할 메뉴가 없습니다."
        sum = 0
        tableView.reloadData()
    }
    
    @objc
    private func didTapRightBarbutton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "결제내역", message: message, preferredStyle: .alert)
        let backAlertAction = UIAlertAction(title: "돌아가기", style: .cancel)
        let buyAlertAction = UIAlertAction(title: "주문", style: .default) { _ in
            WishListViewController.products = []
            WishListViewController.counts = []
            self.message = "결제할 메뉴가 없습니다."
            self.sum = 0
            self.tableView.reloadData()
        }
        alert.addAction(backAlertAction)
        alert.addAction(buyAlertAction)
        present(alert, animated: true)
    }
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WishListViewController.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.imageView?.image = UIImage(named: "\(WishListViewController.products[indexPath.row])")
        cell.textLabel?.text = "\(WishListViewController.products[indexPath.row])"
        cell.detailTextLabel?.text = "주문수량 : \(WishListViewController.counts[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
