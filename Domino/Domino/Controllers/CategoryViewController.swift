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
    
    weak var delegate: CategoryToProductDelegate?

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

extension CategoryViewController: CategoryToProductDelegate {
    func sendData(product: String, productArray: Array<String>) {
        self.navigationItem.title = product
        
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
        let productVC = ProductViewController()
        
        switch indexPath.row {
        case 0:
            print("0")
            delegate?.sendData(product: "슈퍼시드", productArray: [""])
            delegate = self
            productVC.navigationItem.title = "슈퍼시드"
            navigationController?.pushViewController(productVC, animated: true)
            
        case 1:
            print("1")
            delegate?.sendData(product: "슈퍼시드", productArray: [""])
            delegate = self
            productVC.navigationItem.title = "프리미엄"
            navigationController?.pushViewController(productVC, animated: true)
        case 2:
            print("2")
            delegate?.sendData(product: "슈퍼시드", productArray: [""])
            delegate = self
            productVC.navigationItem.title = "클래식"
            navigationController?.pushViewController(productVC, animated: true)
        case 3:
            print("3")
            delegate?.sendData(product: "슈퍼시드", productArray: [""])
            delegate = self
            productVC.navigationItem.title = "사이드디시"
            navigationController?.pushViewController(productVC, animated: true)
        case 4:
            print("4")
            delegate?.sendData(product: "슈퍼시드", productArray: [""])
            delegate = self
            productVC.navigationItem.title = "음료"
            navigationController?.pushViewController(productVC, animated: true)
        case 5:
            print("5")
            delegate?.sendData(product: "슈퍼시드", productArray: [""])
            delegate = self
            productVC.navigationItem.title = "피클&소스"
            navigationController?.pushViewController(productVC, animated: true)
        default:
            print("Error")
        }
        
      
        
    }
}
