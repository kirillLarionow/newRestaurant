//
//  CreateIngredientCreateIngredientAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 12/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias CreateIngredientModule = BaseModule<CreateIngredientModuleInput, CreateIngredientModuleOutput>

extension CreateIngredientModule {
    static func createModule(output: CreateIngredientModuleOutput? = nil) -> CreateIngredientModule {
        let controller = CreateIngredientViewController()
        let presenter = CreateIngredientPresenter()
        let interactor = CreateIngredientInteractor()
        let router = CreateIngredientRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return CreateIngredientModule(view: controller, input: presenter, output: output)
    }
}
