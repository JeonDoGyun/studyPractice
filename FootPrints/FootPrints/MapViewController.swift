//
//  MapViewController.swift
//  FootPrints
//
//  Created by 전도균 on 2022/10/04.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: BasicViewController {
    
    var searchCompleter = MKLocalSearchCompleter() // 검색을 도와주는 변수
    var searchResults = [MKLocalSearchCompletion]() // 검색 결과를 담는 변수
    
    let searchBar = UISearchBar()
    
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    
    let searchTableView = UITableView()
    
    let saveButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAutoLayout()
        setSearchCompleter()
        requestLocationAuthorization()
    }

}

// MARK: - Set Up
extension MapViewController {
    private func setUI() {
        view.addSubview(searchBar)
        view.addSubview(mapView)
        
        searchBar.barTintColor = .clear
        searchBar.barStyle = .black
        searchBar.backgroundColor = .white
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = "장소, 주소를 검색해보세요"
        
        locationManager.delegate = self
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func setAutoLayout() {
        [mapView, searchBar].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            mapView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    private func setSearchCompleter() {
        searchCompleter.delegate = self
        searchCompleter.resultTypes = .pointOfInterest
    }
}

// MARK: - Delegates
extension MapViewController: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        searchTableView.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Completer Error: \(error.localizedDescription)")
    }
}

extension MapViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCompleter.queryFragment = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        let placeVC = PlaceViewController()
        present(placeVC, animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        centerUserLocation(locations: locations)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location-Update Error: \(error.localizedDescription)")
    }
}

// MARK: - UITableView Set UP
extension MapViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
        cell.placeLabel.text = searchResults[indexPath.row].title
        cell.backgroundColor = .clear
        
        return cell
    }
    
}

extension MapViewController: UITableViewDelegate {
    
}

// MARK: - Functions related with MapKit
extension MapViewController {
    private func requestLocationAuthorization() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("앱 내에서 승인을 거부당했습니다.")
        case .denied:
            print("위치 서비스 승인을 거부당했습니다.")
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            mapView.showsUserLocation = true
            requestLocationAuthorization()
        @unknown default:
            print("알 수 없는 정보입니다.")
        }
    }
    
    private func centerUserLocation(locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
}


