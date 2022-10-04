//
//  TabBarForEmployeesTabBarForEmployeesAssembly.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

typealias TabBarForEmployeesModule = BaseModule<TabBarForEmployeesModuleInput, TabBarForEmployeesModuleOutput>

extension TabBarForEmployeesModule {
    static func createModule(output: TabBarForEmployeesModuleOutput? = nil) -> TabBarForEmployeesModule {
        let controller = TabBarForEmployeesViewController()
        let presenter = TabBarForEmployeesPresenter()
        let interactor = TabBarForEmployeesInteractor()
        let router = TabBarForEmployeesRouter()

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        controller.output = presenter
        interactor.output = presenter
        router.output = presenter

        return TabBarForEmployeesModule(view: controller, input: presenter, output: output)
    }
}
