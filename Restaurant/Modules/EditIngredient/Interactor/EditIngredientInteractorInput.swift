//
//  EditIngredientInteractorInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 13/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import Foundation

protocol EditIngredientInteractorInput {
    func editIngredient(ingredientName: String, calories: Int, oldIngredient: IngredientModel)
}
