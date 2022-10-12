//
//  LoginCoordinator.swift
//  Coordinator-Exam
//
//  Created by 전도균 on 2022/10/12.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var delegate: LoginCoordinatorDelegate?
    
    private var navigationController: UINavigationController! // 넘겨주기 위함
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .red
        viewController.delegate = self
        navigationController.viewControllers = [viewController] // stack으로 쌓이는 부분이 배열로 되어있어서 이렇게 새 배열로 만드는 것 가능
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func login() {
        delegate?.didLoggedIn(self)
    }
}
