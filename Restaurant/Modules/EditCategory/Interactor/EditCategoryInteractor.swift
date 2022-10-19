//
//  EditCategoryInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class EditCategoryInteractor {
    var output: EditCategoryInteractorOutput?
}

extension EditCategoryInteractor: EditCategoryInteractorInput {
    func editCategory(categoryName: String, oldCategory: CategoryModel) {
        let category = CategoryModel(name: categoryName)
        
        DataBaseService.shared.udpateCategory(category: category, oldCategory: oldCategory) { result in
            switch result {
            case .success(let category):
                self.output?.udpateCategoriesList()
                print(category)
            case .failure(let error):
                print(error)
            }
        }
    }
}
