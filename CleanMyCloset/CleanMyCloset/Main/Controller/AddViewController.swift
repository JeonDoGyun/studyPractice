//
//  AddViewController.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/10/31.
//

import UIKit
// + 버튼 눌렀을 때 추가할 수 있는 부분
class AddViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let options: [String] = ["사진 촬영하기", "앨범에서 추가", "구글에서 검색하기"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAttributes()
    }
    override func viewDidLayoutSubviews() {
//        self.view.frame = CGRect(x: view.frame.maxX/2-30, y: view.frame.maxY-230, width: 150, height: 90)
    }
}

extension AddViewController {
    private func setUI() {
        view.addSubview(tableView)
        view.backgroundColor = .clear
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AddTableViewCell.self, forCellReuseIdentifier: AddTableViewCell.identifier)
        tableView.layer.cornerRadius = 10
        tableView.separatorStyle = .none
    }
    
    private func setAttributes() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.widthAnchor.constraint(equalToConstant: 150),
            tableView.heightAnchor.constraint(equalToConstant: 110),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
        ])
    }
}

extension AddViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .systemBlue
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier, for: indexPath) as? AddTableViewCell else { fatalError() }
        cell.titleLabel.text = options[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.backgroundColor = .systemBlue
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}

extension AddViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(options[indexPath.row])
    }
}
