//
//  LoginInteractor.swift
//  BaseVIP-C
//
//  Created by Junior Margalho on 07/06/23.
//

import Foundation

protocol LoginInteractorProtocol {
    func performLogin(email: String?, password: String?)
}

class LoginInteractor: LoginInteractorProtocol {
    let loginService = LoginService()
    var presenter: LoginPresenterProtocol?
    
    func performLogin(email: String?, password: String?) {
        guard let email = email, !email.isEmpty, let password = password, !password.isEmpty else {
            presenter?.loginFailed(message: "Preencha todos os campos.")
            return
        }
        
        presenter?.showLoading()
        loginService.authenticate(email: email, password: password) { [weak self] result in
            self?.presenter?.hideLoading()
            switch result {
            case .success(let user):
                self?.presenter?.loginSucceeded(user: user)
            case .failure(let error):
                self?.presenter?.loginFailed(message: error.localizedDescription)
            }
        }
    }
}
