//
//  NextViewController.swift
//  WriteDiary
//
//  Created by 전도균 on 2022/10/16.
//

import UIKit

class NextViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagPickUp : UIImagePickerController!
    var imageV = UIImageView()
    var writeV = UITextView()
    var writeTitle = UITextField()
    var currentDate = Date()
    let logoV = UIImageView()
    let datePicker = UIDatePicker()
    
    func imageAndVideos()-> UIImagePickerController {
        if(imagPickUp == nil){
            imagPickUp = UIImagePickerController()
            imagPickUp.delegate = self
            imagPickUp.allowsEditing = false
        }
        return imagPickUp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        self.initTitleImage()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(dismissSelf))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissSelf))
        
        
        imagPickUp = self.imageAndVideos()
        
        let button = UIButton(frame: CGRect(x: 250, y: 420, width: 150, height: 50))
        
        button.setImage(UIImage(systemName: "camera.on.rectangle"), for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: logoV.bottomAnchor),
        ])
        
        imageV = UIImageView(frame: CGRect(x: 30, y: 180, width: 330, height: 250))
        imageV.layer.cornerRadius = 10
        imageV.clipsToBounds = true
        imageV.layer.borderWidth = 2.0
        imageV.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(imageV)
        
        writeTitle = UITextField(frame: CGRect(x: 30, y: 460, width: 330, height: 30))
        writeTitle.layer.cornerRadius = 10
        writeTitle.clipsToBounds = true
        writeTitle.layer.borderWidth = 1
        writeTitle.layer.borderColor = UIColor.lightGray.cgColor
        writeTitle.placeholder = " 제목을 입력하세요"
        view.addSubview(writeTitle)
        
        writeV = UITextView(frame: CGRect(x: 30, y: 500, width: 330, height: 200))
        writeV.layer.cornerRadius = 10
        writeV.clipsToBounds = true
        writeV.layer.borderWidth = 2.0
        writeV.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(writeV)
        
        let saveBt = UIButton(frame: CGRect(x: 120, y: 720, width: 150, height: 50))
        saveBt.backgroundColor = .lightGray
        saveBt.setTitle("Save", for: .normal)
        saveBt.addTarget(self, action:#selector(self.save(_:)), for: .touchUpInside)
        saveBt.layer.cornerRadius = 10
        self.view.addSubview(saveBt)
        
    }
    
    @objc func handleDatePicker(_ sender: UIDatePicker) {
        currentDate = sender.date
    }
    
    @objc func buttonClicked() {
        let ActionSheet = UIAlertController(title: nil, message: "Select Photo", preferredStyle: .actionSheet)
        
        let cameraPhoto = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
                
                self.imagPickUp.mediaTypes = ["public.image"]
                self.imagPickUp.sourceType = UIImagePickerController.SourceType.camera;
                self.present(self.imagPickUp, animated: true, completion: nil)
            }
            else{
                UIAlertController(title: "iOSDevCenter", message: "No Camera available.", preferredStyle: .alert).show(self, sender: nil);
            }
            
        })
        
        let PhotoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {
            (alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                self.imagPickUp.mediaTypes = ["public.image"]
                self.imagPickUp.sourceType = UIImagePickerController.SourceType.photoLibrary;
                self.present(self.imagPickUp, animated: true, completion: nil)
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
        imageV.image = image
        imagPickUp.dismiss(animated: true, completion: { () -> Void in
            // Dismiss
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagPickUp.dismiss(animated: true, completion: { () -> Void in
            // Dismiss
            
        })
    }
    
    @objc private func didTapButton() {
        let writeVC = UIViewController()
        writeVC.view.backgroundColor = .white
        navigationController?.pushViewController(writeVC, animated: true)
    }
    @objc private func dismissSelf() {
        dismiss(animated: true)
    }
    
    func initTitleImage() {
        logoV.contentMode = .scaleAspectFit
        let logo = UIImage(named: "face1")
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
        guard let title = writeTitle.text, let memo = writeV.text, memo.count > 0 else {
            alert(message: "내용을 입력해주세요")
            return
        }
        // 다른거에도 넣어줘야 됨
        Singleton.shared.title.append(title)
        Singleton.shared.description.append(memo)
        Singleton.shared.feeling.append("face1") // 기분 이미지 넣기
        Singleton.shared.writeDate.append(currentDate) // 저장한 날짜
        let formattedDate = convertDate(currentDate: currentDate)
        Singleton.shared.dateLast.append(formattedDate)
        Singleton.shared.insertDate.append(convertDateToMonthDay(currentDate: currentDate))
        
        if imageV.image == nil {
            let alertController = UIAlertController(title: "경고", message: "이미지를 넣어주세요", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(confirmAction)
            present(alertController, animated: true)
        } else {
            Singleton.shared.image.append(imageV.image!)
            SceneDelegate.tabBarController.selectedIndex = 2
            dismissSelf()
        }
    }
}

extension NextViewController {
    private func convertDate(currentDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let dateStr = dateFormatter.string(from: currentDate)
        return dateStr
    }
    
    private func convertDateToMonthDay(currentDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "KST")
        dateFormatter.dateFormat = "MM/dd(E)"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let dateStr = dateFormatter.string(from: currentDate)
        return dateStr
    }
}
