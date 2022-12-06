//
//  DrawViewController.swift
//  PictureMyDiary
//
//  Created by 전도균 on 2022/12/06.
//

import UIKit
import PencilKit

class DrawViewController: UIViewController {
    
    let canvasView = PKCanvasView()
    let toolPicker = PKToolPicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setUpCanvas()
    }
}

extension DrawViewController {
    private func setUI() {
        view.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        view.addSubview(canvasView)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            canvasView.topAnchor.constraint(equalTo: view.topAnchor),
            canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Undo", style: .plain, target: self, action: #selector(didTapUndoBtn(_:))),
            UIBarButtonItem(title: "redo", style: .plain, target: self, action: #selector(didTapRedoBtn(_:)))
        ]
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "send", style: .plain, target: self, action: #selector(didTapSendBtn(_:))),
            UIBarButtonItem(title: "clear", style: .plain, target: self, action: #selector(didTapClearBtn(_:)))
        ]
    }
    
    private func setUpCanvas() {
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
}

extension DrawViewController {
    @objc
    private func didTapUndoBtn(_ sender: UIBarButtonItem) {
        print(#function)
    }
    
    @objc
    private func didTapRedoBtn(_ sender: UIBarButtonItem) {
        print(#function)
    }
    
    @objc
    private func didTapSendBtn(_ sender: UIBarButtonItem) {
        print(#function)
        // 여기서 받으면 NextVC에 있는 image로 갈 수 있도록
        let nextVC = NextViewController()
        let image = UIGraphicsImageRenderer(bounds: CGRect(x: 0, y: 0, width: 100, height: 100)).image { _ in
            view.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)
        }
        nextVC.drawImage = image
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func didTapClearBtn(_ sender: UIBarButtonItem) {
        canvasView.drawing = PKDrawing()
    }
}
