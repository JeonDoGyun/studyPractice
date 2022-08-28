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
        let addVC = AddViewController()
        addVC.saveDelegate = self
        present(addVC, animated: true)
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
    }
    
    @objc
    func didTappedLoadButton(_ sender: UIButton) {
        collectionView.reloadData()
    }
    
    @objc
    func didTappedClearButton(_ sender: UIButton) {
        print(#function)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError() }
        let title = titles[indexPath.row]
        let expiryDate = expiryDates[indexPath.row]
        let saveDate = saveDates[indexPath.row]
        
        cell.productImageView.image = UIImage(named: "") // 나중에 title이름에 맞는 이미지 몇개 구해서 일단 넣기
        cell.titleLabel.text = "제품명: \(title)"
        cell.expiryDateLabel.text = "유통 기한: \(expiryDate)"
        cell.dateLabel.text = "남은 날짜: \(saveDate)"
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
        
        loadButton.setTitle("불러오기", for: .normal)
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        loadButton.addTarget(self, action: #selector(didTappedLoadButton(_:)), for: .touchUpInside)
        
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

extension MainViewController: saveDateTextFieldDelegate {
    func saveTexts(product: String, expiryDate: String, saveDate: String) {
        titles.append(product)
        expiryDates.append(expiryDate + "일")
        saveDates.append(saveDate)
        
        // tableView처럼 reloadData를 여기에?
    }
}
