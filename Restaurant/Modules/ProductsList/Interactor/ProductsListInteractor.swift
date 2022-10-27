//
//  ProductsListInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class ProductsListInteractor {
    var output: ProductsListInteractorOutput?
}

extension ProductsListInteractor: ProductsListInteractorInput {
    func getProducts() {
        DataBaseService.shared.getProducts { result in
            switch result {
            case .success(let products):
                print(products)
                self.output?.successGetProducts(products: products)
            case .failure(let error):
                print(error)
            }
        }
    }
}
