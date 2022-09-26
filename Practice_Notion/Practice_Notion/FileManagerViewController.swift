//
//  FileManagerViewController.swift
//  Practice_Notion
//
//  Created by 전도균 on 2022/09/26.
//

import UIKit

class FileManagerViewController: UIViewController {
    
    let fileManager = FileManager.default
    
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        save()
    }
    
    
    @IBAction func didTapLoadButton(_ sender: Any) {
        load()
    }
    
}

extension FileManagerViewController {
    
    func save() {
        var isDirectory: ObjCBool = true
        if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirectory) {
            print(getDocumentDirectoryPath().path)
            print("폴더 있음")
        } else {
            do {
                try fileManager.createDirectory(atPath: getMyAppDirectoryPath().path, withIntermediateDirectories: false)
                print("폴더 생성 완료")
            } catch {
                print("폴더 생성 실패: \(error)")
            }
        }
    }
    
    func load() {
        
    }
}

extension FileManagerViewController {
    func getDocumentDirectoryPath() -> URL {
        let documentDirectoryPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectoryPath
    }
    
    func getMyAppDirectoryPath() -> URL{
        let documentDirectoryPath = getDocumentDirectoryPath()
        let myAppDirectoryPath = documentDirectoryPath.appendingPathComponent("My App", isDirectory: true)
        return myAppDirectoryPath
    }
}
