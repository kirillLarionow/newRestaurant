//
//  ChecksTabChecksTabAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias ChecksTabModule = BaseModule<ChecksTabModuleInput, ChecksTabModuleOutput>

extension ChecksTabModule {
    static func createModule(output: ChecksTabModuleOutput? = nil) -> ChecksTabModule {
        let controller = ChecksTabViewController()
        let presenter = ChecksTabPresenter()
        let interactor = ChecksTabInteractor()
        let router = ChecksTabRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return ChecksTabModule(view: controller, input: presenter, output: output)
    }
}
