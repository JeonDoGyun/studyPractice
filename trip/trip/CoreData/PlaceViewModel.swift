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
    
    public var texts: [String] = [] // 제목
    public var memos: [String] = []
    public var dates: [String] = []
    public var marks: [Bool] = []
    public var placeImages: [UIImage] = []
    public var locations: [CLLocation] = []
    
    let request: NSFetchRequest<Place> = NSFetchRequest(entityName: "Place")
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    func sendPlaceInfo(title: String, image: UIImage, memo: String, date:String, isMarked: Bool, location: CLLocation) {
        let place = Place(context: self.context)
        place.title = title
        place.placeImage = image
        place.memo = memo
        place.date = date
        place.isMarked = isMarked
        place.location = location
        
        try? self.context.save()
    }
    
    func updateNewData() {
        do {
            let places: [Place] = try context.fetch(request)
            for place in places {
                if let title = place.title, let memo = place.memo, let date = place.date{
                    texts.append(title)
                    memos.append(memo)
                    dates.append(date)
                }
                marks.append(place.isMarked)
                placeImages.append(place.placeImage)
                locations.append(place.location)
            }
            print(places)
        } catch {
            print("Data Update Error")
        }
    }
    
    func removeAll() {
        do {
            let places: [Place] = try context.fetch(request)
            for place in places {
                context.delete(place)
            }
        } catch {
            print("Data Remove Error")
        }
    }
}
