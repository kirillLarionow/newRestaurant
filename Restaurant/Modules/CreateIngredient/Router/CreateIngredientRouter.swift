//
//  CreateIngredientRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 12/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class CreateIngredientRouter {
  var output: CreateIngredientRouterOutput?
}

extension CreateIngredientRouter: CreateIngredientRouterInput {
    func closeCurrentModule(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
