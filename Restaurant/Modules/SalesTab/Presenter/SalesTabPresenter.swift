//
//  SalesTabSalesTabPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class SalesTabPresenter {
    var output: SalesTabModuleOutput?
    var view: SalesTabViewInput?
    var interactor: SalesTabInteractorInput?
    var router: SalesTabRouterInput?
}

extension SalesTabPresenter: SalesTabModuleInput {

}

extension SalesTabPresenter: SalesTabViewOutput {

}

extension SalesTabPresenter: SalesTabInteractorOutput {

}

extension SalesTabPresenter: SalesTabRouterOutput {

}