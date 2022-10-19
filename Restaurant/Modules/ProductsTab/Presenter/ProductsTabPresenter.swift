//
//  ProductsTabProductsTabPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class ProductsTabPresenter {
    var output: ProductsTabModuleOutput?
    var view: ProductsTabViewInput?
    var interactor: ProductsTabInteractorInput?
    var router: ProductsTabRouterInput?
}

extension ProductsTabPresenter: ProductsTabModuleInput {

}

extension ProductsTabPresenter: ProductsTabViewOutput {
    func productListDidTap() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.goToProductsListModule(navigationController: navigationController)
    }
    
    func createProductDidTap() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.goToCreateProductModule(navigationController: navigationController)
    }
    
    func createIngredientDidTap() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.goToCreateIngredientModule(navigationController: navigationController)
    }
    
    func editIngredientDidTap() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.goToIngredientsListModule(navigationController: navigationController)
    }
    
    func createCategory() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.goToCreateCategoryModule(navigationController: navigationController)
    }
    
    func editCategoryDidTap() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.goToCategoriesListModule(navigationController: navigationController)
    }
}

extension ProductsTabPresenter: ProductsTabInteractorOutput {

}

extension ProductsTabPresenter: ProductsTabRouterOutput {

}
