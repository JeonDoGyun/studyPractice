//
//  MainViewController.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/08/25.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    
    let addButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    let clearButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension MainViewController {
    @objc
    func didTappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc
    func didTappedAddButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "상품, 유통기한, 저장일을 순서대로 입력하시오.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "등록", style: .default, handler: { _ in
            print(alertController.textFields?[2].text ?? "")
        })
        
        alertController.addTextField{ (productName) in
            productName.placeholder = ""
        }
        alertController.addTextField{ (shelfLife) in
            shelfLife.placeholder = "숫자만 입력"
        }
        alertController.addTextField{ (storedDay) in
            storedDay.placeholder = "yyyy-mm-dd"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    @objc
    func didTappedClearButton(_ sender: UIButton) {
        print(#function)
    }
}

extension MainViewController {
    func setUI() {
        view.addSubview(backButton)
        view.addSubview(addButton)
        view.addSubview(tableView)
        view.addSubview(clearButton)
        
        backButton.setTitle("back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(didTappedBackButton(_:)), for: .touchUpInside)
        
        addButton.setTitle("add", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(didTappedAddButton(_:)), for: .touchUpInside)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        clearButton.setTitle("정리하기", for: .normal)
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.backgroundColor = .systemBlue
        clearButton.layer.cornerRadius = 10
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.addTarget(self, action: #selector(didTappedClearButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
            
            clearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
