//
//  LoginService.swift
//  BaseVIP-C
//
//  Created by Junior Margalho on 07/06/23.
//

import Foundation

enum CustomError: Error {
    case authenticationError
}

final class LoginService {
    func authenticate(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if email == "email" && password == "123456" {
                let user = UserModel(name: "Usuário")
                completion(.success(user))
            } else {
                completion(.failure(CustomError.authenticationError))
            }
        }
    }
}
