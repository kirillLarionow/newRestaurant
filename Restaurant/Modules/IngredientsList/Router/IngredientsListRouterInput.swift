//
//  IngredientsListIngredientsListRouterInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol IngredientsListRouterInput {
    func goToEditIngredientModule(editIngredient: IngredientModel, navigationController: UINavigationController)
}
