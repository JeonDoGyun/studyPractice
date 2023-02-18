//
//  MarkListViewController.swift
//  trip
//
//  Created by 전도균 on 2023/01/22.
// 일기 쓴 것 중 즐겨찾기 표시한 내용들에 대해 따로 모아놓는 곳

import UIKit

class MarkListViewController: UIViewController {
    
    let imageView = UIImageView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }
    
}

extension MarkListViewController {
    private func setUI() {
        view.addSubview(imageView)
        view.addSubview(button)
        
        imageView.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(pick(_:)), for: .touchUpInside)
        button.backgroundColor = .blue
    }
    
    private func setConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc
    private func pick(_ sender: UIButton) {
        let actionsheet = UIAlertController(title: "Select Type", message: "", preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "photo", style: .default, handler: { [weak self] _ in
            self?.photo()
        }))
        actionsheet.addAction(UIAlertAction(title: "camera", style: .default, handler: { [weak self] _ in
            self?.camera()
        }))
        actionsheet.addAction(UIAlertAction(title: "확인", style: .cancel))
        
        present(actionsheet, animated: true)
    }
                              
    private func photo() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    private func camera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
}

extension MarkListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("이미지 선택")
        picker.dismiss(animated: false) { () in
            let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imageView.image = image
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("이미지 선택을 취소하였습니다.")
        self.dismiss(animated: false) { () in
            let alert = UIAlertController(title: "", message: "선택이 취소되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
        }
    }
}
