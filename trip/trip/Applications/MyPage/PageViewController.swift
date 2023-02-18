//
//  PageViewController.swift
//  trip
//
//  Created by 전도균 on 2023/01/22.
// 마이페이지
// 다크모드도 적용해서 나중에 넣기

import UIKit

class PageViewController: UIViewController {
    
    let headerView = HeaderView()
    var headerViewTopConstraint: NSLayoutConstraint?
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    
    let categories: [UIViewController] = [TileView("가고 싶은 여행지"), TileView("aba")]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    private func setUI() {
        view.backgroundColor = .white
        [headerView, stackView, scrollView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        headerView.backgroundColor = .green
        
        scrollView.delegate = self
        scrollView.addSubview(stackView)
        
        for category in categories {
            addChild(category)
            stackView.addArrangedSubview(category.view)
            category.didMove(toParent: self)
        }
        
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        
        
        
    }
    
    private func setConstraints() {
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 150),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
    }
    

}

extension PageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let swipingDown = y <= 0
        let shouldSnap = y > 0
        let labelHeight = headerView.profileImageView.frame.height
        
        UIView.animate(withDuration: 0.3) {
            [self.headerView.descriptionLabel].forEach {
                $0.alpha = swipingDown ? 1.0 : 0.0
            }
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0) {
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        }
    }
}
