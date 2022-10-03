//
//  ViewController.swift
//  googleAPI-Ex
//
//  Created by 전도균 on 2022/10/03.
//

import UIKit
import GoogleMaps
import GoogleMapsCore
import GooglePlaces

class ViewController: UIViewController {
    
    
    let searchBar = UISearchBar()
    var tableView = UITableView()
    var tableDataSource = GMSAutocompleteTableDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension ViewController {
    private func setUI() {
        searchBar.barTintColor = .clear
        searchBar.barStyle = .black
        searchBar.backgroundColor = .white
        searchBar.barTintColor = .clear
        searchBar.barStyle = .black
        searchBar.backgroundColor = .white
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = "장소, 주소를 검색해보세요"
        view.addSubview(searchBar)
        
        tableDataSource = GMSAutocompleteTableDataSource()
        tableDataSource.delegate = self

        tableView = UITableView(frame: CGRect(x: 0, y: 100,
                                              width: self.view.frame.size.width,
                                              height: self.view.frame.size.height - 44))
        tableView.delegate = tableDataSource
        tableView.dataSource = tableDataSource
    }
}

extension ViewController: GMSAutocompleteTableDataSourceDelegate {
    func didUpdateAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
        // 검색 전
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        tableView.reloadData()
    }
    
    func didRequestAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
        // Turn the network activity indicator on.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        // Reload table data.
        tableView.reloadData()
    }
    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWith place: GMSPlace) {
        // Do something with the selected place.
        print("Place: \(place)")
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        
        for sub in self.view.subviews {
            if let subview = sub as? UITableView {
                sub.removeFromSuperview()
                break
            }
        }
        searchBar.endEditing(true)
        searchBar.text = ""
    }
    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didFailAutocompleteWithError error: Error) {
        // Handle the error.
        print("Error: \(error.localizedDescription)")
    }
    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didSelect prediction: GMSAutocompletePrediction) -> Bool {
        return true
    }
}
    


extension ViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        // 서치바 터치 후, 검색창 입력을 시작했을 때 호출
        view.addSubview(tableView)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // 서치바 옆의 cancel 버튼을 터치하면 호출되는 함수
        for sub in view.subviews {
            if let subview = sub as? UITableView {
                sub.removeFromSuperview()
                break
            }
        }
        searchBar.endEditing(true)
        searchBar.text = ""
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 서치바에서 검색어가 편집될 때마다 호출되는 함수
        tableDataSource.sourceTextHasChanged(searchText)
    }
    
}
