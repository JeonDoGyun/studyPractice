//
//  ViewController.swift
//  LLDB-Ex
//
//  Created by 전도균 on 2022/10/26.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    private var value = 0
    private let button  = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        button.setTitle("버튼", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        value += 10
    }
}

#if DEBUG
struct ViewControllerRepresentation: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentation()
            
    }
}
#endif
