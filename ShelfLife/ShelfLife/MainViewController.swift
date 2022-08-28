//
//  MainViewController.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/08/25.
//

import UIKit



class MainViewController: UIViewController {
    
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    let addButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    let clearButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension MainViewController {
    @objc
    func didTappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc
    func didTappedAddButton(_ sender: UIButton) {

//        let alertController = UIAlertController(title: "", message: "상품, 유통기한, 저장일을 순서대로 입력하시오.", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
//        let confirmAction = UIAlertAction(title: "등록", style: .default, handler: { _ in
////            self.titles.append(alertController.textFields?[0].text ?? "")
//
//        })
//
//        alertController.addTextField{ (productName) in
//            productName.placeholder = ""
//        }
//        alertController.addTextField{ (shelfLife) in
//            shelfLife.placeholder = "숫자만 입력"
//        }
//
//        alertController.addTextField{ (date) in
//            date.placeholder = "yyyy-MM-dd"
//            self.createDatepicker()
//            date.inputView = self.datePicker
//            date.inputAccessoryView = self.createToolbar()
//
//        }
//
//        alertController.addAction(cancelAction)
//        alertController.addAction(confirmAction)
        let addVC = AddViewController()
        present(addVC, animated: true)
    }
    
    @objc
    func didTappedClearButton(_ sender: UIButton) {
        print(#function)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError() }
        cell.productImageView.image = UIImage(named: "")
        cell.titleLabel.text = "제품명: \(indexPath)"
        cell.expiryDateLabel.text = "유통 기한: "
        cell.dateLabel.text = "남은 날짜: "
        return cell
    }
    
    
}

extension MainViewController {
    func setUI() {
        view.addSubview(backButton)
        view.addSubview(addButton)
        view.addSubview(clearButton)
        view.addSubview(collectionView)
        
        backButton.setTitle("back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(didTappedBackButton(_:)), for: .touchUpInside)
        
        addButton.setTitle("add", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(didTappedAddButton(_:)), for: .touchUpInside)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        flowLayout.itemSize = CGSize(width: view.frame.width/2.3, height: view.frame.height/4)
        flowLayout.minimumInteritemSpacing = 3
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        clearButton.setTitle("정리하기", for: .normal)
//        clearButton.setTitleColor(.white, for: .normal)
//        clearButton.backgroundColor = .systemBlue
//        clearButton.layer.cornerRadius = 10
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.addTarget(self, action: #selector(didTappedClearButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            collectionView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: clearButton.topAnchor, constant: -10),
            
            clearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

