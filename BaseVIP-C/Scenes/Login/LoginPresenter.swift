//
//  LoginPresenter.swift
//  BaseVIP-C
//
//  Created by Junior Margalho on 07/06/23.
//

import Foundation

protocol LoginPresenterProtocol {
    func loginButtonTapped(email: String?, password: String?)
    func showLoading()
    func hideLoading()
    func loginSucceeded(user: UserModel)
    func loginFailed(message: String)
}

class LoginPresenter: LoginPresenterProtocol {
    private weak var view: LoginViewControllerProtocol?
    private var interactor: LoginInteractorProtocol
    private var router: LoginRouterProtocol

    init(view: LoginViewControllerProtocol, interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func loginButtonTapped(email: String?, password: String?) {
        guard let email = email, !email.isEmpty else {
            view?.showAlert("Falha", "Preencha o email!", completion: nil)
            return
        }
        guard let password = password, !password.isEmpty else {
            view?.showAlert("Falha", "Preencha a senha!", completion: nil)
            return
        }
        interactor.performLogin(email: email, password: password)
    }
    
    func showLoading() {
        view?.showLoading()
    }
    
    func hideLoading() {
        view?.hideLoading()
    }
    
    func loginSucceeded(user: UserModel) {
        view?.showAlert("Sucesso", "Bem vindo \(user.name)!") { [weak self] in
            self?.router.navigateToHome(user: user)
        }
    }
    
    func loginFailed(message: String) {
        view?.showAlert("Falha", message, completion: nil)
    }
}
