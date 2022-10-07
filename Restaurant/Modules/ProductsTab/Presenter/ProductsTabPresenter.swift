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
}

extension ProductsTabPresenter: ProductsTabInteractorOutput {

}

extension ProductsTabPresenter: ProductsTabRouterOutput {

}
