//
//  LoginPageLoginPageRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//
import UIKit

class LoginPageRouter {
  var output: LoginPageRouterOutput?
}

extension LoginPageRouter: LoginPageRouterInput {
    func pushToRegistrationPageModule(navigationController: UINavigationController) {
        let registrationPageModule = RegistrationPageModule.createModule()
        navigationController.pushViewController(registrationPageModule.view, animated: true)
    }
    
    func pushToLoginForEmployeesModule(navigationController: UINavigationController) {
        let loginForEmployessModule = LoginForEmployessModule.createModule()
        navigationController.pushViewController(loginForEmployessModule.view, animated: true)
    }
}
