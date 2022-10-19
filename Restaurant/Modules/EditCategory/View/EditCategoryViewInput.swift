//
//  EditCategoryViewInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol EditCategoryViewInput {
    var categoryName: String { get }
    
    func showEditCategoryError(error: String)
    func showEditCategorySuccess(text: String)
    func setCategoryForChange(category: CategoryModel)
}
