//
//  PlaceInfo.swift
//
//
//  Created by 전도균 on 2023. 2. 17..
//
//

import Foundation
import CoreData
import UIKit
import CoreLocation

@objc(Place)
class Place: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var location: CLLocation?
    @NSManaged public var placeImage: UIImage?
    @NSManaged public var title: String?

}

extension Place : Identifiable {
    
}
