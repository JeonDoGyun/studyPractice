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
    let loadButton = UIButton(type: .system)
    let clearButton = UIButton(type: .system)
    
    var titles: [String] = []
    var expiryDates: [String] = []
    var saveDates: [String] = []
    var isNegativeNumbers: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError() }
        let title = titles[indexPath.item]
        let expiryDate = expiryDates[indexPath.item]
        let saveDate = saveDates[indexPath.item]
        
        cell.productImageView.image = UIImage(named: "\(title)")
        if cell.productImageView.image == nil {
            cell.productImageView.image = UIImage(named: "no image")
        }
//        cell.tag = indexPath.item
        
        cell.titleLabel.text = "제품명: \(title)"
        cell.expiryDateLabel.text = "유통 기한: \(expiryDate)"
        cell.dateLabel.text = "남은 날짜: \(saveDate)"
        
        if saveDate.hasPrefix("-") {
            cell.dateLabel.textColor = .red
        }
        
        return cell
    }
    
}

extension MainViewController {
    func setUI() {
        view.addSubview(backButton)
        view.addSubview(addButton)
        view.addSubview(collectionView)
        view.addSubview(loadButton)
        view.addSubview(clearButton)
        
        backButton.setTitle("back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(didTapBackButton(_:)), for: .touchUpInside)
        
        addButton.setTitle("add", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(didTapAddButton(_:)), for: .touchUpInside)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        flowLayout.itemSize = CGSize(width: view.frame.width/2.3, height: view.frame.height/4)
        flowLayout.minimumInteritemSpacing = 3
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        loadButton.setTitle("불러오기", for: .normal)
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        loadButton.addTarget(self, action: #selector(didTapLoadButton(_:)), for: .touchUpInside)
        
        clearButton.setTitle("정리하기", for: .normal)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.addTarget(self, action: #selector(didTapClearButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            collectionView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: clearButton.topAnchor, constant: -10),
            
            loadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadButton.trailingAnchor.constraint(equalTo: clearButton.leadingAnchor),
            loadButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            loadButton.heightAnchor.constraint(equalToConstant: 40),
            
            clearButton.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            clearButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

// Delegate
extension MainViewController: saveDateTextFieldDelegate {
    func saveTexts(product: String, expiryDate: String, saveDate: String) {
        guard let expiryDateToInt = Int(expiryDate) else { fatalError() } // 유통기한 정수 변환
        
        let periodDate = calculateExpiryDate(startDate: saveDate.stringToDate(string: saveDate), expiryDate: expiryDateToInt) // 저장날짜를 시작으로 유통기한 등록한 날짜까지
        let periodDateToString = String(periodDate)
        
        titles.append(product)
        expiryDates.append(expiryDate + "일")
        saveDates.append(periodDateToString + "일")
        
        if periodDate < 0 {
            isNegativeNumbers.append(true)
        } else {
            isNegativeNumbers.append(false)
        }
    }
}

// @objc func
extension MainViewController {
    @objc
    func didTapBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc
    func didTapAddButton(_ sender: UIButton) {
        let addVC = AddViewController()
        addVC.saveDelegate = self
        present(addVC, animated: true)
    }
    
    @objc
    func didTapLoadButton(_ sender: UIButton) {
        collectionView.reloadData()
    }
    
    @objc
    func didTapClearButton(_ sender: UIButton) {
        print(isNegativeNumbers)
        
        for i in 0...isNegativeNumbers.count-1 {
            if isNegativeNumbers[i] {
                collectionView.moveItem(at: IndexPath(item: i, section: 0),
                                        to: IndexPath(item: isNegativeNumbers.count-1, section: 0))
                
                let overExpirydateCell = collectionView.cellForItem(at: IndexPath(item: isNegativeNumbers.count-1, section: 0))
                overExpirydateCell?.isHidden = true
            }
        }
        collectionView.reloadData()
        
//        for i in 0...saveDates.count + 1{
//            if saveDates[i].hasPrefix("-") {
//                saveDates.remove(at: i)
//                collectionView.deleteItems(at: [IndexPath(item: i, section: 0)])
//            }
//        }
    }
    
}

