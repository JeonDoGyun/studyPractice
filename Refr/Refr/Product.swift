//
//  Product.swift
//  Refr
//
//  Created by 전도균 on 2022/11/28.
//

import UIKit

class Product {
    static let shared = Product()
    
    var productImage: [UIImage] = []
    var productName: [String] = []
    var expiryDate: [Int] = []
    
    private init() { }
}
