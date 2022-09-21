//
//  ViewController.swift
//  FileManager2
//
//  Created by 전도균 on 2022/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefualt = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        save()
    }
    @IBAction func didTapLoadButton(_ sender: Any) {
        load()
    }
    
    func save() {
        let restaurant = Restaurant(name: "활어회세꼬시", owner: "가나다")
        do {
            let encodedData = try JSONEncoder().encode(restaurant)
            userDefualt.set(encodedData, forKey: "restaurant")
            print("save")
        } catch {
            print("Save Failed: \(error)")
        }
        
    }
    
    func load() {
        guard let object = userDefualt.data(forKey: "restaurant") else { return }
        do{
            let decodedObject = try JSONDecoder().decode(Restaurant.self, from: object)
            print("Load", decodedObject.name)
        } catch {
            print("Decode Failed: \(error)")
        }
    }
    
}

struct Restaurant: Codable {
    
    let name: String
    let owner: String
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
}
