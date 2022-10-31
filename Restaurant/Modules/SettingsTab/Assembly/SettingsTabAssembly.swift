//
//  SettingsTabSettingsTabAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 28/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias SettingsTabModule = BaseModule<SettingsTabModuleInput, SettingsTabModuleOutput>

extension SettingsTabModule {
    static func createModule(output: SettingsTabModuleOutput? = nil) -> SettingsTabModule {
        
        let controller = SettingsTabViewController()
        let presenter = SettingsTabPresenter()
        let interactor = SettingsTabInteractor()
        let router = SettingsTabRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return SettingsTabModule(view: controller, input: presenter, output: output)
    }
}
