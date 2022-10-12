//
//  AppCoordinator.swift
//  Coordinator-Exam
//
//  Created by 전도균 on 2022/10/12.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var isLoggedIn = false
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        isLoggedIn ? showMainViewController() : showLoginViewController()
    }
    
    private func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    private func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== coordinator } // 계속 쌓이는거 방지해서 추가했던거 지우기
        showMainViewController()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== coordinator }
        showLoginViewController()
    }
}
