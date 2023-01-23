//
//  MapViewController.swift
//  trip
//
//  Created by 전도균 on 2023/01/22.
// 지도 관련 내용

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    let backButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        requestLocationAuthorization()
        settingLocationManager()
    }
}

extension MapViewController {
    private func setUI() {
        view.addSubview(mapView)
        
        mapView.addSubview(backButton)
        
        backButton.setImage(UIImage(systemName: "target"), for: .normal)
        backButton.addTarget(self, action: #selector(didTappedBackButton(_:)), for: .touchUpInside)
    }
    
    private func setConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backButton.widthAnchor.constraint(equalToConstant: 100),
            backButton.heightAnchor.constraint(equalToConstant: 100),
            backButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
            backButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -100),
        ])
    }
    
    private func settingLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    private func requestLocationAuthorization() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined: // 아예 사용불가일 때
            let alertController = UIAlertController(title: "오류 발생", message: "위치 서비스 기능을 사용할 수 없습니다.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true)
        case .denied, .restricted: // 사용 거부되었을 때
            let alertController = UIAlertController(title: "오류 발생", message: "위치 서비스 기능이 꺼져있습니다.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true)
        case .authorizedAlways, .authorizedWhenInUse: // 사용 가능할 때
            mapView.showsUserLocation = true // 사용자의 위치를 표시할 것인가?
            mapView.setUserTrackingMode(.follow, animated: true) // 변하는 위치에 따라 사용자를 따라가도록 할 것인가?
        @unknown default:
            break
        }
        
    }
    
    private func settingLocation() { // 위치 허용해서 들어갔을 때 / 페이지에서는 firstSetting()에 해당
        currentLocation = locationManager.location
        print("현재 위치는", currentLocation!)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways {
            currentLocation = locationManager.location
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedAlways, .authorizedWhenInUse:
            settingLocation()
            break
        case .restricted, .denied:
            break
        default:
            break
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController {
    @objc
    private func didTappedBackButton(_ sender: UIButton) {
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
    }
}
