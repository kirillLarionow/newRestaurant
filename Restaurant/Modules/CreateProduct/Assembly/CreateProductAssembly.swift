//
//  CreateProductCreateProductAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias CreateProductModule = BaseModule<CreateProductModuleInput, CreateProductModuleOutput>

extension CreateProductModule {
    static func createModule(output: CreateProductModuleOutput? = nil) -> CreateProductModule {
        let controller = CreateProductViewController()
        let presenter = CreateProductPresenter()
        let interactor = CreateProductInteractor()
        let router = CreateProductRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter
        
      //  let navigationController = UINavigationController(rootViewController: controller)

        return CreateProductModule(view: controller, input: presenter, output: output)
    }
}
