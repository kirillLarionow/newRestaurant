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
    func getIngredients() {
        DataBaseService.shared.getIngredients { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error)
            }
        }
    }
}
