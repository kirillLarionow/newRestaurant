//
//  CreateProductPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class CreateProductPresenter {
    var output: CreateProductModuleOutput?
    var view: CreateProductViewInput?
    var interactor: CreateProductInteractorInput?
    var router: CreateProductRouterInput?
}

extension CreateProductPresenter: CreateProductModuleInput {

}

extension CreateProductPresenter: CreateProductViewOutput {
    func createIngredientButtonDidTap() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.goToCreateIngredientModule(navigationController: navigationController)
    }
    
    func categoryViewDidTap() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.openCategoriesListModule(navigationController: navigationController)
    }
    
    func addIngredientsImageViewDidTap() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.openIngredientsListModule(navigationController: navigationController)
    }
    
    func createProductButtonDidTap() {
        guard
            let productCategory = view?.productCategory,
            let productName = view?.productName,
            let productDescription = view?.productDescription,
            let productIngredietns = view?.productIngredietns,
            let productCalories = view?.productCalories
        else {
            return
        }
        
        let product = ProductModel(name: productName, description: productDescription,
                                   calories: Int(productCalories) ?? 0, category: productCategory,
                                   ingredients: productIngredietns)
        
        interactor?.createProduct(product: product)
    }
    
    func closeCurrentModule() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.closeCurrentModule(navigationController: navigationController)
    }
}

extension CreateProductPresenter: CreateProductInteractorOutput {
    func successCreateProduct() {
        view?.showSuccesCreateProductAlert()
    }
}

extension CreateProductPresenter: CreateProductRouterOutput {
    func getCategoryToProduct(category: CategoryModel) {
        view?.updateCategory(category: category)
    }
    
    func getIngredientsToProduct(ingredients: [IngredientModel]) {
        view?.updateIngredientsAndCalories(ingredients: ingredients)
    }
}
