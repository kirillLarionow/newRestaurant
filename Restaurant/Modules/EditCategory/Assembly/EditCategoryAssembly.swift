//
//  EditCategoryAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias EditCategoryModule = BaseModule<EditCategoryModuleInput, EditCategoryModuleOutput>

extension EditCategoryModule {
    static func createModule(output: EditCategoryModuleOutput? = nil, category: CategoryModel) -> EditCategoryModule {
        let controller = EditCategoryViewController()
        let presenter = EditCategoryPresenter(category: category)
        let interactor = EditCategoryInteractor()
        let router = EditCategoryRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        let navigationController = UINavigationController(rootViewController: controller)
        
        return EditCategoryModule(view: navigationController, input: presenter, output: output)
    }
}
