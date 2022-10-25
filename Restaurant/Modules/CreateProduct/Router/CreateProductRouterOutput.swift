//
//  CreateProductRouterOutput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import Foundation

protocol CreateProductRouterOutput {
    func getCategoryToProduct(category: CategoryModel)
    func getIngredientsToProduct(ingredients: [IngredientModel])
}
