//
//  HomeViewController.swift
//  Refr
//
//  Created by 전도균 on 2022/11/14.
//

import UIKit

class HomeViewController: UIViewController {
    
    let productVC = ProductViewController()
    
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

    let addButton = UIButton(type: .system)
    let addPV = AddProductView()
    let imagePicker = UIImagePickerController()
    

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
        
        imagePicker.delegate = self
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
        return Product.shared.productName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else { fatalError() }
        cell.productImageView.image = Product.shared.productImage[indexPath.row]
        cell.nameLabel.text = Product.shared.productName[indexPath.row]
        cell.expiryLabel.text = "\(Product.shared.expiryDate[indexPath.row])일"
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
        addPV.cameraButton.addTarget(self, action: #selector(didTapCameraButton(_:)), for: .touchUpInside)
        addPV.photoButton.addTarget(self, action: #selector(didTapPhotoButton(_:)), for: .touchUpInside)
    }
    
    @objc
    private func didTapCameraButton(_ sender: UIButton) {
        openCamera()
    }
    
    @objc
    private func didTapPhotoButton(_ sender: UIButton) {
        openLibrary()
    }
}
// MARK: - Camera & PhotoLibrary
extension HomeViewController {
    func openCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true)
        }
        else {
            print("Camera not available")
        }
    }
    
    func openLibrary() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
}


// MARK: - UIImagePickerControllerDelegate
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            productVC.imageV.image = image
            dismiss(animated: false)
            
            // 뷰 복구하면서 present
            productVC.delegate = self
            productVC.modalPresentationStyle = .fullScreen
            present(productVC, animated: true)
        }
    }
}

extension HomeViewController: DismissProductViewControllerDelegate {
    func dismissProductViewController() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.reloadData()
        addPV.removeFromSuperview()
    }
}
