//
//  ViewController.swift
//  CollectionView-Example
//
//  Created by 전도균 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    var colors: [UIColor] = [.systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink,
                             .systemTeal, .systemBrown, .systemOrange, .systemIndigo, .systemPurple, .systemYellow,
                             .systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink,
                             .systemTeal, .systemBrown, .systemOrange, .systemIndigo, .systemPurple, .systemYellow]
    
    let flowLayout = UICollectionViewFlowLayout() // collectionView의 layout design을 설정

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addGesture()
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError() }
        cell.backgroundColor = colors[indexPath.item]
        cell.label.text = "\(indexPath)"
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let color = colors.remove(at: sourceIndexPath.item)
        colors.insert(color, at: destinationIndexPath.item)
    }
}

extension ViewController {
    func setUI() {
        flowLayout.itemSize = CGSize(width: view.frame.width / 3.3, height: view.frame.height / 4) // 아이템 크기
        flowLayout.minimumInteritemSpacing = 10 // 아이템 간의 가로 거리
        flowLayout.minimumLineSpacing = 20 // 아이템 간의 세로 거리
        flowLayout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4) // collctionView 내부에서 테두리 떨어진 거리
//        flowLayout.scrollDirection = .horizontal // 가로로 스크롤
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func addGesture() {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        collectionView.addGestureRecognizer(gesture)
    }
    
    @objc
    func didLongPress(_ sender: UILongPressGestureRecognizer) {
        let location = sender.location(in: collectionView) // 사용자가 누른 위치
        
        switch sender.state {
        case .began:
            guard let indexPath = collectionView.indexPathForItem(at: location) else { return }
            collectionView.beginInteractiveMovementForItem(at: indexPath)
            print(indexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(location)
        case .ended:
            collectionView.endInteractiveMovement()
        case .cancelled:
            collectionView.cancelInteractiveMovement()
        default:
            break
        }
    }
}
