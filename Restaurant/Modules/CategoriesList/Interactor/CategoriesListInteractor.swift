//
//  CategoriesListInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class CategoriesListInteractor {
    var output: CategoriesListInteractorOutput?
}

extension CategoriesListInteractor: CategoriesListInteractorInput {
    func getCategories() {
        DataBaseService.shared.getCategories { result in
            switch result {
            case .success(let categories):
                self.output?.fetchCategorieData(categories: categories)
                print(categories)
            case .failure(let error):
                print(error)
            }
        }
    }
}
