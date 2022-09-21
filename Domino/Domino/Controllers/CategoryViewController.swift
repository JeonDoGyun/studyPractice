//
//  CategoryViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

class CategoryViewController: BasicViewController {
    
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
        let productVC = ProductViewController()
        
        switch indexPath.row {
        case 0:
            productVC.menuLabel.text = "슈퍼시드"
            productVC.products = ["콰트로 치즈 퐁듀", "우리 고구마", "알로하 하와이안", "글램핑 바비큐"]
            productVC.prices = "10000원"
            productVC.navigationItem.title = "슈퍼시드"
            navigationController?.pushViewController(productVC, animated: true)
        case 1:
            productVC.products = ["직화 스테이크", "와규 앤 비스테카", "블랙타이거 슈림프", "블랙앵거스 스테이크", "더블크러스트 이베리코"]
            productVC.navigationItem.title = "프리미엄"
            productVC.prices = "10000원"
            navigationController?.pushViewController(productVC, animated: true)
        case 2:
            productVC.products = ["포테이토", "페퍼로니", "슈퍼슈프림", "슈퍼디럭스", "불고기", "베이컨체더치즈"]
            productVC.navigationItem.title = "클래식"
            productVC.prices = "10000원"
            navigationController?.pushViewController(productVC, animated: true)
        case 3:
            productVC.products = ["포테이토 순살치킨", "퀴노아 치킨 샐러드", "치킨퐁듀 그라탕", "애플 크러스트 디저트", "슈퍼곡물 치킨", "딸기 슈크림"]
            productVC.navigationItem.title = "사이드디시"
            productVC.prices = "7000원"
            navigationController?.pushViewController(productVC, animated: true)
        case 4:
            productVC.products = ["코카콜라", "코카콜라 제로", "스프라이트", "미닛메이드 스파클링 청포도"]
            productVC.navigationItem.title = "음료"
            productVC.prices = "3000원"
            navigationController?.pushViewController(productVC, animated: true)
        case 5:
            productVC.products = ["핫소스", "우리 피클 M", "우리 피클 L", "스위트 칠리소스", "갈릭 디핑 소스"]
            productVC.navigationItem.title = "피클&소스"
            productVC.prices = "500원"
            navigationController?.pushViewController(productVC, animated: true)
        default:
            print("Error")
        }
        
        
    }
}
