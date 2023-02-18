//
//  PlaceViewModel.swift
//  trip
//
//  Created by 전도균 on 2023/02/18.
//

import Foundation
import UIKit
import MapKit
import CoreData

class PlaceViewModel: ObservableObject {
    
    public var text: String = ""
    public var texts: [String] = []
    let request: NSFetchRequest<Place> = NSFetchRequest(entityName: "Place")
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    func sendPlaceInfo(title: String, image: UIImage, memo: String, isMarked: Bool, location: CLLocation) {
        let place = Place(context: self.context)
        place.title = title
        place.placeImage = image
        place.memo = memo
        place.isMarked = isMarked
        place.location = location
        
        try? self.context.save()
        
        if let title = place.title {
            self.text = title
        }
    }
    
    func showEntire() {
        do {
            let places: [Place] = try context.fetch(request)
            for place in places {
                if let title = place.title {
                    texts.append(title)
                }
            }
            print(texts)
        } catch {
            print(error)
        }
    }
    
}
