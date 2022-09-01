//
//  WelcomePageWelcomePageAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 01/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias WelcomePageModule = BaseModule<WelcomePageModuleInput, WelcomePageModuleOutput>

extension WelcomePageModule {
    static func createModule(output: WelcomePageModuleOutput? = nil) -> WelcomePageModule {
        let controller = WelcomePageViewController()
        let presenter = WelcomePagePresenter()
        let interactor = WelcomePageInteractor()
        let router = WelcomePageRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return WelcomePageModule(view: controller, input: presenter, output: output)
    }
}
