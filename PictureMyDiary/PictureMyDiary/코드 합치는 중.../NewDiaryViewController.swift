//
//  NewDiaryViewController.swift
//  PictureMyDiary
//
//  Created by Eunsu JEONG on 2022/10/08.
//

import UIKit

class NewDiaryViewController: UIViewController {
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        
        //앞 기분 선택 화면
        button1.setTitle("go", for: .normal)
        button1.setImage(UIImage.init(named: "face1"), for: .normal)
        view.addSubview(button1)
        button1.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button1.setTitleColor(.black, for: .normal)
        button1.frame = CGRect(x: 80, y: 300, width: 50, height: 52)
        button1.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        button2.setTitle("go2", for: .normal)
        button2.setImage(UIImage.init(named: "face5"), for: .normal)
        view.addSubview(button2)
        button2.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button2.setTitleColor(.black, for: .normal)
        button2.frame = CGRect(x: 170, y: 300, width: 50, height: 52)
        button2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
        
        button3.setTitle("go3", for: .normal)
        button3.setImage(UIImage.init(named: "face3"), for: .normal)
        view.addSubview(button3)
        button3.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button3.setTitleColor(.black, for: .normal)
        button3.frame = CGRect(x: 260, y: 300, width: 50, height: 52)
        button3.addTarget(self, action: #selector(didTapButton3), for: .touchUpInside)
        
        button4.setTitle("go4", for: .normal)
        button4.setImage(UIImage.init(named: "face4"), for: .normal)
        view.addSubview(button4)
        button4.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button4.setTitleColor(.black, for: .normal)
        button4.frame = CGRect(x: 125, y: 400, width: 50, height: 52)
        button4.addTarget(self, action: #selector(didTapButton4), for: .touchUpInside)
        
        button5.setTitle("go5", for: .normal)
        button5.setImage(UIImage.init(named: "face2"), for: .normal)
        view.addSubview(button5)
        button5.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button5.setTitleColor(.black, for: .normal)
        button5.frame = CGRect(x: 220, y: 400, width: 50, height: 52)
        button5.addTarget(self, action: #selector(didTapButton5), for: .touchUpInside)
       
    }
    
    @objc private func didTapButton() {
        let writeVC = NextViewController()
        let navVC = UINavigationController(rootViewController: writeVC)
        navVC.modalPresentationStyle = .fullScreen
//        navVC.pushViewController(writeVC, animated: true)
        present(navVC, animated: true)
    }
    
    @objc private func didTapButton2() {
        let writeVC2 = NextViewController2()
        let navVC2 = UINavigationController(rootViewController: writeVC2)
        navVC2.modalPresentationStyle = .fullScreen
        present(navVC2, animated: true)
    }
    
    @objc private func didTapButton3() {
        let writeVC3 = NextViewController3()
        let navVC3 = UINavigationController(rootViewController: writeVC3)
        navVC3.modalPresentationStyle = .fullScreen
        present(navVC3, animated: true)
    }
    
    @objc private func didTapButton4() {
        let writeVC4 = NextViewController4()
        let navVC4 = UINavigationController(rootViewController: writeVC4)
        navVC4.modalPresentationStyle = .fullScreen
        present(navVC4, animated: true)
    }
    
    @objc private func didTapButton5() {
        let writeVC5 = NextViewController5()
        let navVC5 = UINavigationController(rootViewController: writeVC5)
        navVC5.modalPresentationStyle = .fullScreen
        present(navVC5, animated: true)
        
    }
    
}
