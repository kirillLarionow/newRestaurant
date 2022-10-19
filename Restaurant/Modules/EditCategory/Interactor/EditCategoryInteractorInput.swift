//
//  EditCategoryInteractorInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import Foundation

protocol EditCategoryInteractorInput {
    func editCategory(categoryName: String, oldCategory: CategoryModel)
}
