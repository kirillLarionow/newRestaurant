//
//  ProductsTabProductsTabRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class ProductsTabRouter {
  var output: ProductsTabRouterOutput?
}

extension ProductsTabRouter: ProductsTabRouterInput {
    func goToProductsListModule(navigationController: UINavigationController) {
        let productsListModule = ProductsListModule.createModule()
        
        navigationController.pushViewController(productsListModule.view, animated: true)
    }
    
    func goToCreateProductModule(navigationController: UINavigationController) {
        let createProductModule = CreateProductModule.createModule()
        navigationController.pushViewController(createProductModule.view, animated: true)
    }
}
