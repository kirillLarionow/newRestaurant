//
//  IngredientsListRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class IngredientsListRouter {
  var output: IngredientsListRouterOutput?
}

extension IngredientsListRouter: IngredientsListRouterInput {
    func goToEditIngredientModule(editIngredient: IngredientModel, navigationController: UINavigationController) {
        let editIngredientModule = EditIngredientModule.createModule(ingredient: editIngredient)
        navigationController.present(editIngredientModule.view, animated: true)
    }
}
