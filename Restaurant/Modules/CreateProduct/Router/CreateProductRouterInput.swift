//
//  CreateProductRouterInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol CreateProductRouterInput {
    func goToCreateIngredientModule(navigationController: UINavigationController)
    func openCategoriesListModule(navigationController: UINavigationController)
    func openIngredientsListModule(navigationController: UINavigationController)
    func closeCurrentModule(navigationController: UINavigationController)
}
