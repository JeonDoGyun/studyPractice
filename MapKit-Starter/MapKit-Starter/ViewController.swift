//
//  ViewController.swift
//  MapKit-Starter
//
//  Created by 전도균 on 2022/09/26.
//

import CoreLocation
import MapKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mapView.preferredConfiguration = MKImageryMapConfiguration() // 지도 이미지 방식 바꾸기
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation() // 사용자 위치 지속적으로 업데이트
        requestLocationAuthorization()
        fetchLocationsOnMap(locations: Stadium.stadiums)
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        mapView.preferredConfiguration = MKHybridMapConfiguration()
        centerLocation(location: Stadium.stadiums.last!)
    }
}

extension ViewController: MKMapViewDelegate {
    // tableView의 cellforRowAt이랑 비슷
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil } // MKUserLocation일 경우에는 무시하겠다는 의미
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Custom")
            annotationView?.canShowCallout = true // 클릭한거 위치 어딘지
            annotationView?.clusteringIdentifier = "stadium" // 줌아웃했을 때 겹치는 것들 합쳐지는거
//            annotationView?.displayPriority = .required // 어느게 먼저 합쳐질지 정하는 것
        } else {
            annotationView?.annotation = annotation // 갱신
        }
        annotationView?.image = UIImage(named: "poketball")
        annotationView?.frame.size = CGSize(width: 40, height: 40)
//        annotationView?.annotation?.subtitle = "" // 옆에 subtitle 붙이는 거
//        annotationView?.rightCalloutAccessoryView = UIView() // 좌표에 옆에 이미지 보여주는 거
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title)
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        // 방향
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        centerUserLocation(locations: locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationManager.requestLocation()
    }
}

extension ViewController {
    private func requestLocationAuthorization() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation()
            mapView.showsUserLocation = true
//            mapView.userTrackingMode = .follow // 위치에 맞게 따라다니는거
        @unknown default: // 케이스가 새롭게 추가 되었을 때 case에 안적어서 오류가 생기는걸 방지하기 위해 사용. 새로운 게 unknown으로 빠짐.
            break
        }
    }
    
    private func centerUserLocation(locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1) // 얼마나 많이 줌인을 할 것인가
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    private func fetchLocationsOnMap(locations: [LocationRepresentable]) {
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            mapView.addAnnotation(annotation)
        }
    }
    
    private func centerLocation(location: LocationRepresentable) {
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
}
