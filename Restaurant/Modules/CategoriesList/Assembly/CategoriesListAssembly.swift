//
//  CategoriesListCategoriesListAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias CategoriesListModule = BaseModule<CategoriesListModuleInput, CategoriesListModuleOutput>

extension CategoriesListModule {
    static func createModule(output: CategoriesListModuleOutput? = nil) -> CategoriesListModule {
        let controller = CategoriesListViewController()
        let presenter = CategoriesListPresenter()
        let interactor = CategoriesListInteractor()
        let router = CategoriesListRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return CategoriesListModule(view: controller, input: presenter, output: output)
    }
}
