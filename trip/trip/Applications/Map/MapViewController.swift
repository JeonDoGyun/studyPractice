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
    var currentLocation = CLLocation()
    
    let backButton = UIButton(type: .system)
    let writeButton = UIButton(type: .system)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        requestLocationAuthorization()
        settingLocationManager()
        startLocation(location: currentLocation)
    }
}
	
extension MapViewController {
    private func setUI() {
        view.addSubview(mapView)
        
        mapView.addSubview(backButton)
        mapView.addSubview(writeButton)
        mapView.delegate = self
        
        backButton.setImage(UIImage(systemName: "target"), for: .normal)
        backButton.addTarget(self, action: #selector(didTappedBackButton(_:)), for: .touchUpInside)
        backButton.backgroundColor = .white
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.white.cgColor
        backButton.layer.cornerRadius = 25
        
        writeButton.setImage(UIImage(systemName: "pencil.line"), for: .normal)
        writeButton.addTarget(self, action: #selector(didTappedWriteButton(_:)), for: .touchUpInside)
        writeButton.backgroundColor = .white
        writeButton.layer.borderWidth = 1
        writeButton.layer.borderColor = UIColor.white.cgColor
        writeButton.layer.cornerRadius = 25
    }
    
    private func setConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        writeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -10),
            backButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -150),
            
            writeButton.widthAnchor.constraint(equalToConstant: 50),
            writeButton.heightAnchor.constraint(equalToConstant: 50),
            writeButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -10),
            writeButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20),
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
            mapView.setUserTrackingMode(.follow, animated: true)
        @unknown default:
            break
        }
        
    }
    
    private func settingLocation() { // 위치 허용해서 들어갔을 때 / 페이지에서는 firstSetting()에 해당
        if let currentLocation = locationManager.location {
            print("현재 위치는", currentLocation)
        } else {
            print("위치 정보가 없습니다.")
        }
    }
    
    private func startLocation(location: CLLocation) { // 현재 위치를 중심으로 지도 띄우기
        let currentCoordinate = location.coordinate
        let currentCenter = CLLocationCoordinate2D(latitude: currentCoordinate.latitude, longitude: currentCoordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let currentRegion = MKCoordinateRegion(center: currentCenter, span: span)
        mapView.showsUserLocation = true
        mapView.setRegion(currentRegion, animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways {
            guard locationManager.location != nil else {
                print("위치업데이트 실패")
                return
            }
            if let location = locations.last {
                startLocation(location: location)
                print("위치 업데이트 성공")
            }
            
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
    
    func makeAnnotation(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let annotationView = MKPointAnnotation()
        annotationView.title = "A"
        annotationView.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.addAnnotation(annotationView)
        print("add")
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Press annotationView")
    }
}

extension MapViewController {
    @objc
    private func didTappedBackButton(_ sender: UIButton) {
        startLocation(location: self.currentLocation)
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        
    }
    
    @objc
    private func didTappedWriteButton(_ sender: UIButton) {
        let memoVC = MemoViewController()
        memoVC.currentLocation = currentLocation
        if let sheet = memoVC.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in
                return 600
            }), .large()]
            sheet.prefersGrabberVisible = true // 상단 그레이버(회색바) 표시
        }
        present(memoVC, animated: true)
    }
}

