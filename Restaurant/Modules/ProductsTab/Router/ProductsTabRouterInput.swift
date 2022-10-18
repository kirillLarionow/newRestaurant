//
//  ProductsTabProductsTabRouterInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol ProductsTabRouterInput {
    func goToProductsListModule(navigationController: UINavigationController)
    func goToCreateProductModule(navigationController: UINavigationController)
    func goToCreateIngredientModule(navigationController: UINavigationController)
    func goToIngredientsListModule(navigationController: UINavigationController)
}
