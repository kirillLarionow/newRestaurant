//
//  IngredientsListViewInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol IngredientsListViewInput {
    var navigationController: UINavigationController? { get }
    var ingredientsForCreateproduct: [IngredientModel]? { get }
    
    func updateView(ingredients: [IngredientModel], ingredientsListState: IngredientsListState)
}
