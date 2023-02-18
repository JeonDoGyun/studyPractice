//
//  ImageTransformer.swift
//  trip
//
//  Created by 전도균 on 2023/02/18.
//

import Foundation
import UIKit
import MapKit

class LocationTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let location = value as? CLLocation else { return nil }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: location, requiringSecureCoding: true)
            return data
        } catch {
            print("location archiving error")
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        do {
            _ = try NSKeyedUnarchiver.unarchivedObject(ofClass: CLLocation.self, from: data)
            return data
        } catch {
            print("location unarchiving error")
            return nil
        }
    }
}

class ImageTransformer : ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
            return data
        } catch {
            print("image archiving error")
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        do {
            _ = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return data
        } catch {
            print("image unarchiving error")
            return nil
        }
    }
}
