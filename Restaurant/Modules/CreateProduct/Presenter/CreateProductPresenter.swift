//
//  CreateProductCreateProductPresenter.swift
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
}

extension CreateProductPresenter: CreateProductInteractorOutput {

}

extension CreateProductPresenter: CreateProductRouterOutput {

}
