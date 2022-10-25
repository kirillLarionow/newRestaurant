//
//  CreateProductViewInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol CreateProductViewInput {
    var navigationController: UINavigationController? { get }
    
    func updateCategory(category: CategoryModel)
    func updateIngredients(ingredients: [IngredientModel])
}
