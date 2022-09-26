//
//  ViewController.swift
//  Practice_Notion
//
//  Created by 전도균 on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefault = UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        save()
    }
    
    @IBAction func didTapLoadButton(_ sender: Any) {
        load()
    }
    
    
    func save() {
        let restaurant = Restaurant(name: "활어회세꼬시", owner: "가나다")
        do{
            let encodedData = try JSONEncoder().encode(restaurant)
            userDefault.set(encodedData, forKey: "restaurant")
            print("Save")
        } catch {
            print("Save Failed: \(error)")
        }
    }
    
    func load() {
        guard let object = userDefault.data(forKey: "restaurant") else { return }
        do {
            let decodedObject = try JSONDecoder().decode(Restaurant.self, from: object)
            print("Load", decodedObject)
        } catch {
            print("Decode Failed: \(error)")
        }
    }
}

class Restaurant: Codable {
    let name: String
    let owner: String
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
}
