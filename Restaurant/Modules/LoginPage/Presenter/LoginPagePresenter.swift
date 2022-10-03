//
//  LoginPageLoginPagePresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit


class LoginPagePresenter {
    var output: LoginPageModuleOutput?
    var view: LoginPageViewInput?
    var interactor: LoginPageInteractorInput?
    var router: LoginPageRouterInput?
}

extension LoginPagePresenter: LoginPageModuleInput {

}

extension LoginPagePresenter: LoginPageViewOutput {
    func registrationButtonDidTap() {
        guard let navigationController = view?.navigationController else {
            fatalError("controller is not navigation controller")
        }
        
        router?.pushToRegistrationPageModule(navigationController: navigationController)
    }
    
    func loginForEmployeesDidTap() {
        guard let navigationController = view?.navigationController else {
            fatalError("controller is not navigation controller")
        }
        
        router?.pushToLoginForEmployeesModule(navigationController: navigationController)
    }
    
     func loginIn(email: String, password: String) {
         interactor?.loginIn(email: email, password: password)
    }
}

extension LoginPagePresenter: LoginPageInteractorOutput {
    func sendError(error: String) {
        view?.updateErrorMessage(error: error)
    }
}

extension LoginPagePresenter: LoginPageRouterOutput {

}
