//
//  ViewController.swift
//  Practice_Notion
//
//  Created by 전도균 on 2022/09/18.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private let mapView = MKMapView()
    
    override func loadView() {
        super.loadView()
        view = mapView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
