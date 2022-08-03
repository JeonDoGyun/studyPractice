//
//  ViewController.swift
//  RatingsApp-Code
//
//  Created by 전도균 on 2022/08/01.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let titles = ["Bill Evans", "Oscar Peterson", "Dave Brubeck"]
    let subtitles = ["Tic-Tac-Toe", "Spin the Bottle", "Texas Hold'em Poker"]
    let stars = ["4Stars", "5Stars", "2Stars"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: view.frame.width,
                                 height: view.frame.height)
//        tableView.backgroundColor = .yellow tableView 배경 넣기
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell") // table cell 등록 / CustomTableViewCell 재지정했음
        tableView.dataSource = self // 데이터를 넣어주기 위한 선언
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(barButtonDidTapped(_:)))
        // action은 항상 #selector 넣어줘야 됨
        }
        @objc
        func barButtonDidTapped(_ sender: UIBarButtonItem){
            let navVC = UINavigationController(rootViewController: AddPlayerViewController())
            present(navVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    } // 몇개의 row가 있느냐?? 3줄
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {fatalError()}
        // register를 해줬기 때문에 Cell 이름을 보고 customcell 불러옴.
        // 재사용 가능한 cell로 설정 / cell이 많아졌을 때 발생할 수 있는 문제를 해결
//        cell.textLabel?.text = titles[indexPath.row]
        // 애플이 정해놓은 기본값 1개 있음 / indexPath = [section, row]
        // cell.mytitle이 안뜨는건 tableview로 인식하기 때문 -> 다운캐스팅으로 해결
        
        cell.myTitle.text = titles[indexPath.row]
        cell.myTitle.sizeToFit()
        cell.mySubtitle.text = subtitles[indexPath.row]
        cell.mySubtitle.sizeToFit()
        cell.myImageView.image = UIImage(named: stars[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    } // cell의 구조를 짜서 던지는거
    
    
}
