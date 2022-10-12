//
//  MainCoordinator.swift
//  Coordinator-Exam
//
//  Created by 전도균 on 2022/10/12.
//

import UIKit

protocol MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.view.backgroundColor = .yellow
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func logout() {
        delegate?.didLoggedOut(self)
    }
}
