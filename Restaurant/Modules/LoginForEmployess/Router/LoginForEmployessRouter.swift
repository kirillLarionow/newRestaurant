//
//  LoginForEmployessLoginForEmployessRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 03/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class LoginForEmployessRouter {
  var output: LoginForEmployessRouterOutput?
}

extension LoginForEmployessRouter: LoginForEmployessRouterInput {
    func goToTabBarForEmployeesModule() {
        guard let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else {
            fatalError()
        }
        
        let tabBarForEmployeesModule = TabBarForEmployeesModule.createModule()
        tabBarForEmployeesModule.view.modalTransitionStyle = .crossDissolve
        tabBarForEmployeesModule.view.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarForEmployeesModule.view, animated: true)
    }
}
