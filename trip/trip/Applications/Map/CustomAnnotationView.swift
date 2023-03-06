//
//  CustomAnnotationView.swift
//  trip
//
//  Created by 전도균 on 2023/03/06.
//

import UIKit
import MapKit

class CustomAnnotationView: MKAnnotationView {

    static let identifier = String(describing: CustomAnnotationView.self)
    
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        centerOffset = CGPoint(x: 0, y: -frame.size.height/2)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundColor = .clear
    }
}

extension CustomAnnotationView: MKAnnotation {
    let image: UIImage?
    let coordinate: CLLocationCoordinate2D
    
    init (image: UIImage, coordinate: CLLocationCoordinate2D) {
        self.image = UIImage(systemName: "square.and.arrow.up")
        self.coordinate = coordinate
        
        super.init()
    }
    
}
