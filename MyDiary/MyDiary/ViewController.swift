//
//  ViewController.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension ViewController {
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
        cell.titleLabel.text = Singleton.shared.title[indexPath.row]
        cell.descriptionLabel.text = Singleton.shared.description[indexPath.row]
        cell.timeLabel.text = Singleton.shared.dateLast[indexPath.row]
//        cell.picture.image = Singleton.shared.image
        
        cell.selectionStyle = .none
        cell.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: CustomTableViewCellDelegate {
    func didTapEditButton(tag: Int) {
        let editVC = EditViewController()
        editVC.modalPresentationStyle = .fullScreen
        editVC.navigationItem.title = Singleton.shared.title[tag]
        editVC.tag = tag
        self.navigationController?.pushViewController(editVC, animated: true)
//        self.present(editVC, animated: true) // title, description, image 정보 같이 들고가게 만들기
    }
    
    func didTapDeleteButton(tag: Int) {
        let alertController = UIAlertController(title: "", message: "일기를 삭제하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "삭제", style: .default) { _ in
            Singleton.shared.title.remove(at: tag)
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
        print(tag)
    }
    
}
