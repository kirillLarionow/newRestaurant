//
//  CategoriesListCategoriesListInteractorOutput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import Foundation

protocol CategoriesListInteractorOutput {
    func fetchCategorieData(categories: [CategoryModel])
}
