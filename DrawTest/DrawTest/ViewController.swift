//
//  ViewController.swift
//  DrawTest
//
//  Created by 전도균 on 2022/12/05.
//

import UIKit
import PencilKit

class ViewController: UIViewController {
    
    let canvasView = PKCanvasView()
    let toolPicker = PKToolPicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setUpCanvasView()
    }
    
    
}

extension ViewController {
    private func setUI() {
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
    
    private func setUpCanvasView() {
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
}

extension ViewController {
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
        let imageVC = ImageViewController()
        let image = UIGraphicsImageRenderer(bounds: canvasView.bounds).image { _ in
            view.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)
        }
        imageVC.drawImage = image
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
    
    @objc
    private func didTapClearBtn(_ sender: UIBarButtonItem) {
        canvasView.drawing = PKDrawing()
    }
}
