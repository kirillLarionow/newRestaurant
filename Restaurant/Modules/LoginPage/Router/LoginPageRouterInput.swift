//
//  LoginPageLoginPageRouterInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol LoginPageRouterInput {
    func pushToRegistrationPageModule(navigationController: UINavigationController)
    func pushToLoginForEmployeesModule(navigationController: UINavigationController)
}
