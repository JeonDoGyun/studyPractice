//
//  ClosetViewController.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/09/23.
//

import UIKit

class ClosetViewController: BasicViewController {
    
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        print("A")
    }
}

// MARK: - UI SetUp
extension ClosetViewController {
    private func setUI() {
        [collectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        view.backgroundColor = .brown
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        flowLayout.itemSize = CGSize(width: 10, height: 10)
        flowLayout.minimumLineSpacing = 2
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    private func setAttribute() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
    }
}

// MARK: - UICollectionView SetUp
extension ClosetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
    
    
}
extension ClosetViewController: UICollectionViewDelegate {
    
}

