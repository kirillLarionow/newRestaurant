//
//  ProductsListProductsListAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias ProductsListModule = BaseModule<ProductsListModuleInput, ProductsListModuleOutput>

extension ProductsListModule {
    static func createModule(output: ProductsListModuleOutput? = nil) -> ProductsListModule {
        let controller = ProductsListViewController()
        let presenter = ProductsListPresenter()
        let interactor = ProductsListInteractor()
        let router = ProductsListRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return ProductsListModule(view: controller, input: presenter, output: output)
    }
}
