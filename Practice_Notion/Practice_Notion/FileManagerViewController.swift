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
    
    func save1() {
        var isDirectory: ObjCBool = true
        if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirectory) {
            let someString = "Hello world"
            do {
                try someString.write(to: getMyAppFilePath(), atomically: true, encoding: .utf8)
                print("파일 쓰기 성공")
            } catch {
                print("파일 쓰기 실패: \(error)")
            }
        } else {
            do {
                try fileManager.createDirectory(atPath: getMyAppDirectoryPath().path, withIntermediateDirectories: false)
                print("폴더 생성 완료")
            } catch {
                print("폴더 생성 실패: \(error)")
            }
        }
    }
    
    func load1() {
        do {
            let someString = try String(contentsOf: getMyAppFilePath())
            print(someString)
        } catch {
            print("파일 로드 에러: \(error)")
        }
    }
}

extension FileManagerViewController {
    func save() {
        var isDirectory: ObjCBool = true
        if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirectory) {
            let person = Person(name: "ABC", age: "111")
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: person, requiringSecureCoding: false)
                do {
                    try data.write(to: getMyAppFilePath())
                    print("파일 쓰기 성공")
                } catch {
                    print("파일 쓰기 에러: \(error)")
                }
            } catch {
                print("아카이브 에러: \(error)")
            }
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
        do {
            let data = try Data(contentsOf: getMyAppFilePath())
            do {
                let person = try NSKeyedUnarchiver.unarchivedObject(ofClass: Person.self, from: data)
                print("언아카이브 성공: \(person)")
            } catch {
                print("언아카이브 에러: \(error)")
            }
        } catch {
            print("파일 로드 에러: \(error)")
        }
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
    
    func getMyAppFilePath() -> URL {
        let myAppDirectoryPath = getMyAppDirectoryPath()
        let filePath = myAppDirectoryPath.appendingPathComponent("Test.txt")
        return filePath
    }
}

class Person: NSObject, NSCoding, NSSecureCoding {
    
    static var supportsSecureCoding: Bool = true
    
    let name: String
    let age: String
    
    // Encoding
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
    }
    
    // Decoding
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let age = coder.decodeObject(forKey: "age") as!  String
        self.init(name: name, age: age)
    }
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}
