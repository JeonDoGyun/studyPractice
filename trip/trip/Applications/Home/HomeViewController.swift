//
//  HomeViewController.swift
//  trip
//
//  Created by 전도균 on 2023/01/22.
// 들어가면 나오는 첫 페이지 / 월별 내용 모아놓는 곳

import UIKit

class HomeViewController: UIViewController {
    
    lazy var scrollView = UIScrollView()
    let pageControl = UIPageControl()
    let colors: [UIColor] = [UIColor.red, UIColor.green, UIColor.blue]
    var images: [UIImage] = []

    override func viewDidLoad() {
        setUI()
        setConstraints()
    }

    func setUI() {
        view.addSubview(scrollView)
        view.backgroundColor = .lightGray
        scrollView.isPagingEnabled = true
        view.addSubview(pageControl)
        scrollView.delegate = self
        
        pageControl.numberOfPages = colors.count
        pageControl.backgroundStyle = .automatic
        
        for i in colors.indices {
            let imageView = UIImageView()
            imageView.backgroundColor = colors[i]
            imageView.contentMode = .scaleAspectFit
            let xPos = view.frame.width * CGFloat(i)
            
            imageView.frame = CGRect(x: xPos, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize.width = view.frame.width * CGFloat(i+1)
            
            scrollView.addSubview(imageView)
        }
    }
    
    func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.width
        print(value)
        pageControl.currentPage = Int(round(value))
    }
}
