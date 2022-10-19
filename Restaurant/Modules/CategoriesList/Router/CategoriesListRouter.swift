//
//  CategoriesListRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class CategoriesListRouter {
   
  var output: CategoriesListRouterOutput?
}

extension CategoriesListRouter: CategoriesListRouterInput {
    func goToEditCategoryModule(editCategory: CategoryModel, navigationController: UINavigationController) {
        let editCategoryModule = EditCategoryModule.createModule(output: self, category: editCategory)
        navigationController.present(editCategoryModule.view, animated: true)
    }
}


extension CategoriesListRouter: EditCategoryModuleOutput {
    func udpateCategoriesList() {
        output?.updateCategoriesList()
    }
}
