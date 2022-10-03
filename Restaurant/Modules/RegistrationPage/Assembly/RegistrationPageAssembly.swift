//
//  RegistrationPageRegistrationPageAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 08/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias RegistrationPageModule = BaseModule<RegistrationPageModuleInput, RegistrationPageModuleOutput>

extension RegistrationPageModule {
    static func createModule(output: RegistrationPageModuleOutput? = nil) -> RegistrationPageModule {
        
        let controller = RegistrationPageViewController()
        let presenter = RegistrationPagePresenter()
        let interactor = RegistrationPageInteractor()
        let router = RegistrationPageRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return RegistrationPageModule(view: controller, input: presenter, output: output)
    }
}
