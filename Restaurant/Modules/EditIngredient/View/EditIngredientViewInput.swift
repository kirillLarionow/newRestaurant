//
//  EditIngredientViewInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 13/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol EditIngredientViewInput {
    var ingredientName: String { get }
    var ingredientCalories: String { get }
    
    func showEditIngredientError(error: String)
    func showEditIngredientSuccess(text: String)
    func setIngredientForChange(ingredient: IngredientModel)
}
