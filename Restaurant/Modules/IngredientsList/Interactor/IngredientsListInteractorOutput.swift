//
//  IngredientsListInteractorOutput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import Foundation

protocol IngredientsListInteractorOutput {
    func fetchIngredientsData(ingredients: [IngredientModel])
}
