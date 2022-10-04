//
//  ProductsTabProductsTabAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias ProductsTabModule = BaseModule<ProductsTabModuleInput, ProductsTabModuleOutput>

extension ProductsTabModule {
    static func createModule(output: ProductsTabModuleOutput? = nil) -> ProductsTabModule {
        let controller = ProductsTabViewController()
        let presenter = ProductsTabPresenter()
        let interactor = ProductsTabInteractor()
        let router = ProductsTabRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter
        
        let navigationController = UINavigationController(rootViewController: controller)

        return ProductsTabModule(view: navigationController, input: presenter, output: output)
    }
}
