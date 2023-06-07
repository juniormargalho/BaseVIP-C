//
//  LoginInterfaces.swift
//  BaseVIP-C
//
//  Created by Junior Margalho on 07/06/23.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject {
    func showAlert(_ title: String,_ message: String, completion: (() -> Void)?)
    func showLoading()
    func hideLoading()
}

extension LoginViewController: LoginViewControllerProtocol {
    func showAlert(_ title: String,_ message: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showLoading() {
        let loadingView = UIView(frame: view.bounds)
        loadingView.backgroundColor = UIColor(white: 0.3, alpha: 0.8)
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = loadingView.center
        activityIndicator.startAnimating()
        loadingView.addSubview(activityIndicator)
        view.addSubview(loadingView)
        self.loadingView = loadingView
    }
    
    func hideLoading() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}
