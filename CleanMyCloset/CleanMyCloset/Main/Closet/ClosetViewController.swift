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
    let addButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAttribute()
    }
}

// MARK: - UI SetUp
extension ClosetViewController {
    private func setUI() {
        [collectionView, addButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        flowLayout.itemSize = CGSize(width: 150, height: 150)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
        
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        addButton.addTarget(self, action: #selector(didTapAddButton(_:)), for: .touchUpInside)
        addButton.backgroundColor = .systemBlue
        addButton.layer.cornerRadius = 35
        addButton.setTitleColor(.white, for: .normal)
        
    }
    
    private func setAttribute() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: addButton.topAnchor),
            
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}

// MARK: - UICollectionView SetUp
extension ClosetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError() }
        cell.backgroundColor = .red
        return cell
    }
    
    
}
extension ClosetViewController: UICollectionViewDelegate {
    
}

extension ClosetViewController {
    @objc
    private func didTapAddButton(_ sender: UIButton) {
        let addVC = AddViewController()
        present(addVC, animated: true)
    }
}
