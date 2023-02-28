//
//  ViewController.swift
//  PHPicker-Ex
//
//  Created by 전도균 on 2023/02/28.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    var configuration = PHPickerConfiguration()
    let imageView = UIImageView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        view.addSubview(button)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(createPHPicker), for: .touchUpInside)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc func createPHPicker() {
        configuration.filter = .any(of: [.livePhotos, .videos, .images])
        configuration.selectionLimit = 0
        let phpicker = PHPickerViewController(configuration: configuration)
        phpicker.delegate = self
        
        self.present(phpicker, animated: true)
    }

}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    DispatchQueue.main.async {
                        self.imageView.image = image as? UIImage
                    }
                }
            }
        }
    }
