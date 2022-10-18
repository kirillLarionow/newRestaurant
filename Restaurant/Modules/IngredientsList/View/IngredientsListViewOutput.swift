//
//  IngredientsListIngredientsListViewOutput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

protocol IngredientsListViewOutput {
    func viewDidLoad()
    func editIngredientDidTap(editIngredient: IngredientModel)
}
