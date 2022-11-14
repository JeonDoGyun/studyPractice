//
//  HomeViewController.swift
//  Refr
//
//  Created by 전도균 on 2022/11/14.
//

import UIKit

class HomeViewController: UIViewController {
    
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    let addButton = UIButton(type: .system)
    let addPV = AddProductView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension HomeViewController {
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(addButton)
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        flowLayout.itemSize = CGSize(width: view.frame.width/2.3, height: view.frame.height/4)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 4, left: 20, bottom: 4, right: 20)
        
        addButton.setTitle("+", for: .normal)
        addButton.addTarget(self, action: #selector(didTapAddButton(_:)), for: .touchUpInside)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        addButton.backgroundColor = .systemBlue
        addButton.layer.cornerRadius = 35
        addButton.setTitleColor(.white, for: .normal)
    }
    
    private func setLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalToConstant: 70),
            
            
        ])
    }
}

// MARK: - CollectionView Extension
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else { fatalError() }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

// MARK: - Button Objc
extension HomeViewController {
    @objc
    private func didTapAddButton(_ sender: UIButton) {
        view.backgroundColor = .gray
        collectionView.backgroundColor = .gray
        view.addSubview(addPV)
        addPV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addPV.widthAnchor.constraint(equalToConstant: 200),
            addPV.heightAnchor.constraint(equalToConstant: 150),
            addPV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            addPV.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
