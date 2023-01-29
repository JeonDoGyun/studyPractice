//
//  ViewController.swift
//  stickyHeader-Ex2
//
//  Created by 전도균 on 2023/01/30.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    
    var headerView = UIView()
    var upperHeaderView = UIView()
    
    let maxHeight: CGFloat = 100.0
    let minHeight: CGFloat = 100.0
    
    var headerHeight = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        headerHeight.constant = maxHeight
    }

    private func setUI() {
        view.addSubview(tableView)
        view.addSubview(headerView)
        
        headerView.addSubview(upperHeaderView)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .red
        headerView.backgroundColor = .blue
        upperHeaderView.backgroundColor = .green
    }
    
    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerHeight.constant = 100
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerHeight.constant),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            headerHeight.constant = max(abs(scrollView.contentOffset.y), minHeight)
        } else {
            headerHeight.constant = minHeight
        }
        let offset = -scrollView.contentOffset.y
        let percentage = (offset-100)/50
        upperHeaderView.alpha = percentage
    }
}
