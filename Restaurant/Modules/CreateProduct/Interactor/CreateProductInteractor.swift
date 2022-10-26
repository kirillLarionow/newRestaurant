//
//  CreateProductInteractor.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class CreateProductInteractor {
    var output: CreateProductInteractorOutput?
}

extension CreateProductInteractor: CreateProductInteractorInput {
    func createProduct(product: ProductModel) {
        DataBaseService.shared.createProduct(product: product) { result in
            switch result {
            case .success(let product):
                print(product)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
