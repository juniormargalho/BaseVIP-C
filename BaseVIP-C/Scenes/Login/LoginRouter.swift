//
//  LoginRouter.swift
//  BaseVIP-C
//
//  Created by Junior Margalho on 07/06/23.
//

import UIKit

protocol LoginRouterProtocol {
    func navigateToHome(user: UserModel)
}

class LoginRouter: LoginRouterProtocol {
    weak var coordinator: LoginCoordinator?
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }

    func navigateToHome(user: UserModel) {
        coordinator?.navigateToHome(user: user)
    }
}
