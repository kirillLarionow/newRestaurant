//
//  CreateIngredientCreateIngredientViewInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 12/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol CreateIngredientViewInput {
    var ingredientName: String { get }
    var ingredientCalories: String { get }
    var navigationController: UINavigationController? { get }
    
    func showCreateIngredientError(error: String)
    func showCreateIngredientSuccess(text: String)
}
