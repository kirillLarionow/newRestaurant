//
//  LoginPageLoginPageAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias LoginPageModule = BaseModule<LoginPageModuleInput, LoginPageModuleOutput>

extension LoginPageModule {
    static func createModule(output: LoginPageModuleOutput? = nil) -> LoginPageModule {
        let controller = LoginPageViewController()
        let presenter = LoginPagePresenter()
        let interactor = LoginPageInteractor()
        let router = LoginPageRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return LoginPageModule(view: controller, input: presenter, output: output)
    }
}
