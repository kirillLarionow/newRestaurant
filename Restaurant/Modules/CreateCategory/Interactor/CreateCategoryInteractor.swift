//
//  CreateCategoryInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class CreateCategoryInteractor {
    var output: CreateCategoryInteractorOutput?
}

extension CreateCategoryInteractor: CreateCategoryInteractorInput {
    func createCategory(categoryName: String) {
        let category = CategoryModel(name: categoryName)
        DataBaseService.shared.createCategory(category: category) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error)
            }
        }
    }
}
