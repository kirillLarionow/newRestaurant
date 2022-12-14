//
//  CategoriesListViewInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol CategoriesListViewInput {
    var navigationController: UINavigationController? { get }
    var category: CategoryModel? { get }
    
    func updateView(categories: [CategoryModel], categoriesListState: CategoriesListState)
}
