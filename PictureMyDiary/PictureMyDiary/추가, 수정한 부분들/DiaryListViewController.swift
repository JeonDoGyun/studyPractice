//
//  DiaryListViewController.swift
//  PictureMyDiary
//
//  Created by Eunsu JEONG on 2022/10/08.
//

import UIKit

class DiaryListViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var currentDate = Date()
    
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

extension DiaryListViewController {
    private func setUI() {
        view.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        view.addSubview(tableView)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 30
        tableView.rowHeight = UITableView.automaticDimension
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

extension DiaryListViewController: UITableViewDataSource {
    // Section - section별로 cell을 1개씩만 넣기
    func numberOfSections(in tableView: UITableView) -> Int {
        return Singleton.shared.title.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
        cell.feeling.image = UIImage(named: Singleton.shared.feeling[indexPath.section])
        cell.titleLabel.text = Singleton.shared.title[indexPath.section]
        cell.picture.image = Singleton.shared.image[indexPath.section]
        cell.descriptionLabel.text = Singleton.shared.description[indexPath.section]
        cell.dayLabel.text = Singleton.shared.dateLast[indexPath.section]
        cell.lateLabel.text = Singleton.shared.writeDate[indexPath.section].dateToString()
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    // Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let dashLineView = DashLineView()
        return dashLineView
    }
}

extension DiaryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let buttonView = ButtonView()
        buttonView.tag = section
        buttonView.delegate = self
        return buttonView
    }
}

extension DiaryListViewController: ButtonViewDelegate {
    func didTapEditButton(tag: Int) {
         // 해당 표정을 가진 뷰컨으로 어떻게 넘기지??
        let writeVC = WriteViewController()
        writeVC.modalPresentationStyle = .fullScreen
        writeVC.tag = tag
        writeVC.writeTitle.text = Singleton.shared.title[tag]
        writeVC.writeV.text = Singleton.shared.description[tag]
        writeVC.imageV.image = Singleton.shared.image[tag]
        self.present(writeVC, animated: true)
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
    }
}
