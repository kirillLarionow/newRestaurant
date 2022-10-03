//
//  LoginForEmployessLoginForEmployessAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 03/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias LoginForEmployessModule = BaseModule<LoginForEmployessModuleInput, LoginForEmployessModuleOutput>

extension LoginForEmployessModule {
    static func createModule(output: LoginForEmployessModuleOutput? = nil) -> LoginForEmployessModule {
        
        let controller = LoginForEmployessViewController()
        let presenter = LoginForEmployessPresenter()
        let interactor = LoginForEmployessInteractor()
        let router = LoginForEmployessRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return LoginForEmployessModule(view: controller, input: presenter, output: output)
    }
}
