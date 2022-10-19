//
//  CreateCategoryCreateCategoryRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class CreateCategoryRouter {
  var output: CreateCategoryRouterOutput?
}

extension CreateCategoryRouter: CreateCategoryRouterInput {
    func closeCurrentModule(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
