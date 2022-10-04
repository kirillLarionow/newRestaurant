//
//  SalesTabSalesTabAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias SalesTabModule = BaseModule<SalesTabModuleInput, SalesTabModuleOutput>

extension SalesTabModule {
    static func createModule(output: SalesTabModuleOutput? = nil) -> SalesTabModule {
        let controller = SalesTabViewController()
        let presenter = SalesTabPresenter()
        let interactor = SalesTabInteractor()
        let router = SalesTabRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return SalesTabModule(view: controller, input: presenter, output: output)
    }
}
