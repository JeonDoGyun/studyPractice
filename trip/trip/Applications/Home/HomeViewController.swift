//
//  HomeViewController.swift
//  trip
//
//  Created by 전도균 on 2023/01/22.
// 들어가면 나오는 첫 페이지 / 월별 내용 모아놓는 곳

import UIKit

class HomeViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    
    var images: [UIImage] = []
    var imageViews: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        scrollView.delegate = self
        scrollView.backgroundColor = .blue
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = .black
        
        
        addContentScrollView()
        setPageControl()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 200),
            
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    private func addContentScrollView() {
        guard let pencil = UIImage(systemName: "pencil"), let od = UIImage(systemName: "square.and.arrow.up.circle.fill") else { fatalError() }
        images.append(pencil)
        images.append(od)
        images.append(pencil)
           
           for i in 0..<images.count {
               let imageView = UIImageView()
               let xPos = scrollView.frame.width * CGFloat(i)
               imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
               imageView.image = images[i]
               scrollView.addSubview(imageView)
               scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
           }
           
       }
    
    private func setPageControl() {
            pageControl.numberOfPages = images.count
            
        }
    
    private func setPageControlSelectedPage(currentPage:Int) {
            pageControl.currentPage = currentPage
        }
        

}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}
