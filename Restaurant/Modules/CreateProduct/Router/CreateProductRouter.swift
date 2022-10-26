//
//  CreateProductRouter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class CreateProductRouter {
  var output: CreateProductRouterOutput?
}

extension CreateProductRouter: CreateProductRouterInput {
    func goToCreateIngredientModule(navigationController: UINavigationController) {
        let createIngredientModule = CreateIngredientModule.createModule()
        navigationController.pushViewController(createIngredientModule.view, animated: true)
    }
    
    func openCategoriesListModule(navigationController: UINavigationController) {
        let categoriesListModule = CategoriesListModule.createModule(output: self, categoriesListState: .choice)
        navigationController.present(categoriesListModule.view, animated: true)
    }
    
    func openIngredientsListModule(navigationController: UINavigationController) {
        let ingredientsListModule = IngredientsListModule.createModule(output: self, ingredientsListSate: .choice)
        navigationController.present(ingredientsListModule.view, animated: true)
    }
    
    func closeCurrentModule(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}

extension CreateProductRouter: CategoriesListModuleOutput {
    func setupCategoryInCreateProduct(category: CategoryModel) {
        output?.getCategoryToProduct(category: category)
    }
}

extension CreateProductRouter: IngredientsListModuleOutput {
    func setupIngredientsToCreateProduct(ingredients: [IngredientModel]) {
        output?.getIngredientsToProduct(ingredients: ingredients)
    }
}
