//
//  IngredientsListIngredientsListAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias IngredientsListModule = BaseModule<IngredientsListModuleInput, IngredientsListModuleOutput>

extension IngredientsListModule {
    static func createModule(output: IngredientsListModuleOutput? = nil, ingredientsListSate: IngredientsListState) -> IngredientsListModule {
        let controller = IngredientsListViewController()
        let presenter = IngredientsListPresenter(ingredientsListState: ingredientsListSate)
        let interactor = IngredientsListInteractor()
        let router = IngredientsListRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return IngredientsListModule(view: controller, input: presenter, output: output)
    }
}
