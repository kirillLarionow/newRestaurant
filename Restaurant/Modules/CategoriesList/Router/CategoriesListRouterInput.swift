//
//  CategoriesListRouterInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol CategoriesListRouterInput {
    func goToEditCategoryModule(editCategory: CategoryModel, navigationController: UINavigationController)
}
