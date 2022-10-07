//
//  LoginPageLoginPageInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import FirebaseAuth
import FirebaseCore

class LoginPageInteractor {
    var output: LoginPageInteractorOutput?
}

extension LoginPageInteractor: LoginPageInteractorInput {
    func loginIn(email: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error != nil, let error = error as NSError? {
                
                if let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                    switch errorCode {
                    case .invalidEmail:
                        self.output?.sendError(error: "Некорректный email")
                    case .wrongPassword:
                        self.output?.sendError(error: "Неправильный пароль или логин")
                    case .userNotFound:
                        self.output?.sendError(error: "Такого пользователя нет")
                    default:
                        break
                    }
                }
            } else {
                print("succes login from FireBase")
            }
        }
    }
}
