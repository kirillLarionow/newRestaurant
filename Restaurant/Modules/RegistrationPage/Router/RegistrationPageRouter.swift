//
//  RegistrationPageRegistrationPageRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 08/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//
import UIKit

class RegistrationPageRouter {
  var output: RegistrationPageRouterOutput?
}

extension RegistrationPageRouter: RegistrationPageRouterInput {
    func closeRegistrationPage(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
