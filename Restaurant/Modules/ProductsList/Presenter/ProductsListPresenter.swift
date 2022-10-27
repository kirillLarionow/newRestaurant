//
//  ProductsListProductsListPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class ProductsListPresenter {
    var output: ProductsListModuleOutput?
    var view: ProductsListViewInput?
    var interactor: ProductsListInteractorInput?
    var router: ProductsListRouterInput?
}

extension ProductsListPresenter: ProductsListModuleInput {

}

extension ProductsListPresenter: ProductsListViewOutput {
    func viewDidLoad() {
        interactor?.getProducts()
    }
}

extension ProductsListPresenter: ProductsListInteractorOutput {
    func successGetProducts(products: [ProductModel]) {
        view?.updateView(products: products)
    }
}

extension ProductsListPresenter: ProductsListRouterOutput {

}
