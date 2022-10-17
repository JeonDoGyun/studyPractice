//
//  NextViewController4.swift
//  WriteDiary
//
//  Created by 전도균 on 2022/10/16.
//

import UIKit

class NextViewController4: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagPickUp4 : UIImagePickerController!
    var imageV4 : UIImageView!
    var writeV4 : UITextView!
    var writeTitle4: UITextField!
    
    func imageAndVideos()-> UIImagePickerController{
        if(imagPickUp4 == nil){
            imagPickUp4 = UIImagePickerController()
            imagPickUp4.delegate = self
            imagPickUp4.allowsEditing = false
        }
        return imagPickUp4
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        
        self.initTitleImage()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(dismissSelf))

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissSelf))
        

        imagPickUp4 = self.imageAndVideos()
        
        let button = UIButton(frame: CGRect(x: 250, y: 400, width: 150, height: 50))
        button.setImage(UIImage(systemName: "camera.on.rectangle"), for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        
        
        imageV4 = UIImageView(frame: CGRect(x: 30, y: 150, width: 330, height: 250))
        imageV4.layer.cornerRadius = 10
        imageV4.clipsToBounds = true
        imageV4.layer.borderWidth = 2.0
        imageV4.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(imageV4)
        
        writeTitle4 = UITextField(frame: CGRect(x: 30, y: 440, width: 330, height: 30))
        writeTitle4.layer.cornerRadius = 10
        writeTitle4.clipsToBounds = true
        writeTitle4.layer.borderWidth = 1
        writeTitle4.layer.borderColor = UIColor.lightGray.cgColor
        writeTitle4.placeholder = " 제목을 입력하세요"
        view.addSubview(writeTitle4)
        
        writeV4 = UITextView(frame: CGRect(x: 30, y: 480, width: 330, height: 200))
        writeV4.layer.cornerRadius = 10
        writeV4.clipsToBounds = true
        writeV4.layer.borderWidth = 2.0
        writeV4.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(writeV4)
        
        let saveBt4 = UIButton(frame: CGRect(x: 120, y: 700, width: 150, height: 50))
        saveBt4.backgroundColor = .lightGray
        saveBt4.setTitle("Save", for: .normal)
        saveBt4.addTarget(self, action:#selector(self.save(_:)), for: .touchUpInside)
        saveBt4.layer.cornerRadius = 10
        self.view.addSubview(saveBt4)
        
    
        
        
    }
    @objc func buttonClicked() {
        let ActionSheet = UIAlertController(title: nil, message: "Select Photo", preferredStyle: .actionSheet)
        
        let cameraPhoto = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
                
                self.imagPickUp4.mediaTypes = ["public.image"]
                self.imagPickUp4.sourceType = UIImagePickerController.SourceType.camera;
                self.present(self.imagPickUp4, animated: true, completion: nil)
            }
            else{
                UIAlertController(title: "iOSDevCenter", message: "No Camera available.", preferredStyle: .alert).show(self, sender: nil);
            }
            
        })
        
        let PhotoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {
            (alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                self.imagPickUp4.mediaTypes = ["public.image"]
                self.imagPickUp4.sourceType = UIImagePickerController.SourceType.photoLibrary;
                self.present(self.imagPickUp4, animated: true, completion: nil)
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction) -> Void in
            
        })
        
        ActionSheet.addAction(cameraPhoto)
        ActionSheet.addAction(PhotoLibrary)
        ActionSheet.addAction(cancelAction)
        
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            let presentC : UIPopoverPresentationController  = ActionSheet.popoverPresentationController!
            presentC.sourceView = self.view
            presentC.sourceRect = self.view.bounds
            self.present(ActionSheet, animated: true, completion: nil)
        }
        else{
            self.present(ActionSheet, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageV4.image = image
        imagPickUp4.dismiss(animated: true, completion: { () -> Void in
            // Dismiss
        })
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagPickUp4.dismiss(animated: true, completion: { () -> Void in
            // Dismiss
        })
    }
    
    @objc private func didTapButton() {
        let writeVC4 = UIViewController()
        writeVC4.view.backgroundColor = .white
        navigationController?.pushViewController(writeVC4, animated: true)
    }
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    func initTitleImage() {
        let logoV = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
         logoV.contentMode = .scaleAspectFit
         
         let logo = UIImage(named: "face4")
         logoV.image = logo
        view.addSubview(logoV)
        logoV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoV.widthAnchor.constraint(equalToConstant: 80),
            logoV.heightAnchor.constraint(equalToConstant: 80),
            logoV.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            logoV.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        }
    
    @objc func save(_ sender: Any) {
        guard let memo = writeV4.text, memo.count > 0 else {
            alert(message: "내용을 입력해주세요")
            return
        }
        
        let newDiary = Diary(content: memo)
        Diary.dummyDiaryList.append(newDiary)
        
        dismissSelf()
    }
   
    
}
