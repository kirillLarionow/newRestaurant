//
//  CreateCategoryAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias CreateCategoryModule = BaseModule<CreateCategoryModuleInput, CreateCategoryModuleOutput>

extension CreateCategoryModule {
    static func createModule(output: CreateCategoryModuleOutput? = nil) -> CreateCategoryModule {
        let controller = CreateCategoryViewController()
        let presenter = CreateCategoryPresenter()
        let interactor = CreateCategoryInteractor()
        let router = CreateCategoryRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return CreateCategoryModule(view: controller, input: presenter, output: output)
    }
}
