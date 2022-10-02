//
//  ViewController.swift
//  Practice_Notion
//
//  Created by 전도균 on 2022/09/18.
//

import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mapView.preferredConfiguration = MKHybridMapConfiguration()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        requestLocationAuthorization()
        fetchLocationsOnMap(locations: Stadium.stadiums)
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        centerLocation(location: Stadium.stadiums.last!)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Custom")
            annotationView?.canShowCallout = true // pin을 클릭했을 때 title이 나오게 됨
            annotationView?.clusteringIdentifier = "stadium"
            
        } else {
            annotationView?.annotation = annotation // 갱신
        }
        annotationView?.image = UIImage(named: "ImageName")
        annotationView?.frame.size = CGSize(width: 40, height: 40)
        annotationView?.rightCalloutAccessoryView = UIView()
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title)
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        <#code#>
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        centerUserLocation(locations: locations)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocationAuthorization()
    }
}

extension ViewController {
    private func requestLocationAuthorization() {
        let status = locationManager.authorizationStatus // 사용자의 현재 상태
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation() // delegate 필요
            mapView.showsUserLocation = true
//            mapView.userTrackingMode = .follow
        @unknown default:
            break
        }
    }
    
    private func centerUserLocation(locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }// 가장 마지막 좌표값
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func fetchLocationsOnMap(locations: [LocationRepresentable]) {
        for location in locations {
            let annotation = MKPointAnnotation() // 위치 pin의 이름
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            mapView.addAnnotation(annotation)
        }
    }
    
    private func centerLocation(location: LocationRepresentable) {
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
}
