//
//  CreateCategoryViewInput.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

protocol CreateCategoryViewInput {
    var categoryName: String { get }
    var navigationController: UINavigationController? { get }
    
    func showCreateCategoryError(error: String)
    func showCreateCategorySuccess(text: String)
}
