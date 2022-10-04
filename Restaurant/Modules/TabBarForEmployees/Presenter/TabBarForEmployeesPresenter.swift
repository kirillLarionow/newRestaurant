//
//  TabBarForEmployeesTabBarForEmployeesPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class TabBarForEmployeesPresenter {
    var output: TabBarForEmployeesModuleOutput?
    var view: TabBarForEmployeesViewInput?
    var interactor: TabBarForEmployeesInteractorInput?
    var router: TabBarForEmployeesRouterInput?
}

extension TabBarForEmployeesPresenter: TabBarForEmployeesModuleInput {

}

extension TabBarForEmployeesPresenter: TabBarForEmployeesViewOutput {

}

extension TabBarForEmployeesPresenter: TabBarForEmployeesInteractorOutput {

}

extension TabBarForEmployeesPresenter: TabBarForEmployeesRouterOutput {

}