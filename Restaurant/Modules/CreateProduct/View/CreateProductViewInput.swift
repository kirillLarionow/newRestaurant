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
    var productCategory: CategoryModel? { get }
    var productName: String? { get }
    var productDescription: String? { get }
    var productIngredietns: [IngredientModel]? { get }
    var productCalories: String? { get }
    
    func updateCategory(category: CategoryModel)
    func updateIngredientsAndCalories(ingredients: [IngredientModel])
    func showSuccesCreateProductAlert()
    func showErrorAlert(message: String)
}
