//
//  WriteDiaryViewController.swift
//  d
//
//  Created by 정유진 on 2022/10/14.
//

import UIKit


class WriteDiaryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagPickUp : UIImagePickerController!
    var imageV : UIImageView!
    var writeV : UITextView!
    
    func imageAndVideos()-> UIImagePickerController{
        if(imagPickUp == nil){
            imagPickUp = UIImagePickerController()
            imagPickUp.delegate = self
            imagPickUp.allowsEditing = false
        }
        return imagPickUp
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagPickUp = self.imageAndVideos()
        
        let button = UIButton(frame: CGRect(x: 100, y: 1000, width: 150, height: 50))
        button.center = view.center
        button.backgroundColor = .lightGray
        button.setTitle("Choose picture", for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        
        
        imageV = UIImageView(frame: CGRect(x: 30, y: 150, width: 330, height: 250))
        imageV.layer.cornerRadius = 10
        imageV.clipsToBounds = true
        imageV.layer.borderWidth = 2.0
        imageV.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(imageV)
        
        writeV = UITextView(frame: CGRect(x: 30, y: 480, width: 330, height: 200))
        writeV.layer.cornerRadius = 10
        writeV.clipsToBounds = true
        writeV.layer.borderWidth = 2.0
        writeV.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(writeV)
        
        let saveBt = UIButton(frame: CGRect(x: 100, y: 1500, width: 150, height: 50))
        saveBt.center = view.center
        saveBt.backgroundColor = .lightGray
        saveBt.setTitle("Choose picture", for: .normal)
        saveBt.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(saveBt)
        
        
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
    
}
