//
//  EditIngredientInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 13/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import FirebaseFirestore
import FirebaseDatabase

class EditIngredientInteractor {
    var output: EditIngredientInteractorOutput?
}

extension EditIngredientInteractor: EditIngredientInteractorInput {
    func editIngredient(ingredientName: String, calories: Int, oldIngredient: IngredientModel) {
        let ingredient = IngredientModel(name: ingredientName, calories: calories)
        
        DataBaseService.shared.udpateIngredient(ingredient: ingredient, oldIngredient: oldIngredient) { result in
            switch result {
            case .success(let success):
                print(success)
                self.output?.updateIngredientsList()
                self.output?.successEditIngredient()
            case .failure(let error):
                print(error)
            }
        }
    }
}
