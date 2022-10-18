//
//  EditIngredientEditIngredientAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 13/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias EditIngredientModule = BaseModule<EditIngredientModuleInput, EditIngredientModuleOutput>

extension EditIngredientModule {
    static func createModule(output: EditIngredientModuleOutput? = nil, ingredient: IngredientModel) -> EditIngredientModule {
        let controller = EditIngredientViewController()
        let presenter = EditIngredientPresenter(ingredient: ingredient)
        let interactor = EditIngredientInteractor()
        let router = EditIngredientRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        let navigationController = UINavigationController(rootViewController: controller)
        
        return EditIngredientModule(view: navigationController, input: presenter, output: output)
    }
}
