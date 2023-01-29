//
//  ViewController.swift
//  TableView-StickyHeader-Ex
//
//  Created by 전도균 on 2023/01/29.
//

import UIKit

class ViewController: UIViewController {
    
    var stickyHeaderView = UIView()
    var headerView = UIView()
    var scrollView = UIScrollView()
    var tableView = UITableView()
    
    var stickyHeaderViewTop = NSLayoutConstraint()
    var scrollViewTop = NSLayoutConstraint()
    var tableViewHeight = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableViewHeight.constant = tableView.contentSize.height
    }
    
    private func setUI() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        
        scrollView.delegate = self
        
        scrollView.addSubview(tableView)
        
        view.addSubview(headerView)
        headerView.backgroundColor = .yellow
        view.addSubview(stickyHeaderView)
        stickyHeaderView.backgroundColor = .blue
        view.addSubview(scrollView)
        scrollView.backgroundColor = .lightGray
        
    }
    
    private func setConstraints() {
        tableViewHeight = tableView.heightAnchor.constraint(equalToConstant: 0)
        stickyHeaderViewTop = stickyHeaderView.topAnchor.constraint(equalTo: view.topAnchor)
        scrollViewTop = scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        
        stickyHeaderView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollViewTop,
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            tableViewHeight,
            
            stickyHeaderViewTop,
            stickyHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stickyHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stickyHeaderView.heightAnchor.constraint(equalToConstant: 50),
                        
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
                    
        ])
        
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var headerConstant = scrollView.contentOffset.y
        var tableConstant = CGFloat()
        
        headerConstant = headerConstant < 0 ? 0 : headerConstant
        headerConstant = headerConstant > 10 ? 10 : headerConstant
        tableConstant = 50 - (headerConstant - 0) / (10) * (50 - 10)
        
        stickyHeaderViewTop.constant = -headerConstant
        scrollViewTop.constant = tableConstant
        stickyHeaderView.alpha = 1 - headerConstant / 10
        headerView.alpha = headerConstant / 10
    }
}
