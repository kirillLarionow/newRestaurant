//
//  ChecksTabChecksTabPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class ChecksTabPresenter {
    var output: ChecksTabModuleOutput?
    var view: ChecksTabViewInput?
    var interactor: ChecksTabInteractorInput?
    var router: ChecksTabRouterInput?
}

extension ChecksTabPresenter: ChecksTabModuleInput {

}

extension ChecksTabPresenter: ChecksTabViewOutput {

}

extension ChecksTabPresenter: ChecksTabInteractorOutput {

}

extension ChecksTabPresenter: ChecksTabRouterOutput {

}