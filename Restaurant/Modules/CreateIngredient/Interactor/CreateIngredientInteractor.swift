//
//  CreateIngredientInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 12/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class CreateIngredientInteractor {
    var output: CreateIngredientInteractorOutput?
}

extension CreateIngredientInteractor: CreateIngredientInteractorInput {
    func createIngredient(ingredientName: String, calories: Int) {
        let ingredient = IngredientModel(name: ingredientName, calories: calories)
        
        DataBaseService.shared.createIngredient(ingredient: ingredient) { result in
            switch result {
            case .success(let success):
                print(success)
                self.output?.successCreateIngredient()
            case .failure(let error):
                print(error)
            }
        }
    }
}
