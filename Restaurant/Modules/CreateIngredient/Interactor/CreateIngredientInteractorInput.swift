//
//  CreateIngredientInteractorInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 12/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol CreateIngredientInteractorInput {
    func createIngredient(ingredientName: String, calories: Int)
}
