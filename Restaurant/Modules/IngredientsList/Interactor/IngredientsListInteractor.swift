//
//  IngredientsListIngredientsListInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import FirebaseFirestore
import FirebaseDatabase

class IngredientsListInteractor {
    var output: IngredientsListInteractorOutput?
}

extension IngredientsListInteractor: IngredientsListInteractorInput {
    func getIngredients() {
        DataBaseService.shared.getIngredients { result in
            switch result {
            case .success(let ingredients):
                self.output?.fetchIngredientsData(ingredients: ingredients)
                print(ingredients)
            case .failure(let error):
                print(error)
            }
        }
    }
}
