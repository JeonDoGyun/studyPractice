//
//  ViewController.swift
//  InfiniteScroll-Example
//
//  Created by 전도균 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let colors: [UIColor] = [.yellow, .red, .green, .blue, .purple, .yellow, .red, .green]
    private var cellWidth: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setFlowLayout()
    }
    
}

// MARK: - UI
extension ViewController {
    private func setFlowLayout() {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let left: CGFloat = colors.count > 1 ? -20 : 0
        
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0)
        
        cellWidth = width
        collectionView.contentOffset.x = width
    }
    
    private func setUI() {
        view.backgroundColor = .systemBackground
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1),
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else { fatalError() }
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        performInfiniteScroll(scrollView: scrollView)
    }
    
    func performInfiniteScroll(scrollView: UIScrollView) {
//        guard colors.count > 1 else { return } // item이 1개 들어왔을 때 방지
        let currentPage = scrollView.contentOffset.x
        let firstPage = cellWidth
        let fakeFirstPage = cellWidth * CGFloat(colors.count - 2)
        let lastPage = cellWidth * CGFloat(colors.count - 3)
        let fakeLastPage: CGFloat = 0
        
        if currentPage == fakeFirstPage {
            scrollView.contentOffset.x = firstPage
        } else if currentPage == fakeLastPage {
            scrollView.contentOffset.x = lastPage
        }
        
    }
}
