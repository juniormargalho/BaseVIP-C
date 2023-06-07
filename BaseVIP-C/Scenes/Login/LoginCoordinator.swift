//
//  LoginCoordinator.swift
//  BaseVIP-C
//
//  Created by Junior Margalho on 07/06/23.
//

import UIKit

class LoginCoordinator {
    private var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = LoginViewController()
        let interactor = LoginInteractor()
        let router = LoginRouter(coordinator: self)
        let presenter = LoginPresenter(view: viewController, interactor: interactor, router: router)
        router.coordinator = self
        interactor.presenter = presenter
        viewController.presenter = presenter
        navigationController?.setViewControllers([viewController], animated: false)
    }

    func navigateToHome(user: UserModel) {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
