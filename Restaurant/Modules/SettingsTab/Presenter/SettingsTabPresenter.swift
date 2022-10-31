//
//  SettingsTabSettingsTabPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 28/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class SettingsTabPresenter {
    var output: SettingsTabModuleOutput?
    var view: SettingsTabViewInput?
    var interactor: SettingsTabInteractorInput?
    var router: SettingsTabRouterInput?
}

extension SettingsTabPresenter: SettingsTabModuleInput {

}

extension SettingsTabPresenter: SettingsTabViewOutput {

}

extension SettingsTabPresenter: SettingsTabInteractorOutput {

}

extension SettingsTabPresenter: SettingsTabRouterOutput {

}