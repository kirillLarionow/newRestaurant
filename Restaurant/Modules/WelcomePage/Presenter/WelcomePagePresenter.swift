//
//  WelcomePageWelcomePagePresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 01/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class WelcomePagePresenter {
    var output: WelcomePageModuleOutput?
    var view: WelcomePageViewInput?
    var interactor: WelcomePageInteractorInput?
    var router: WelcomePageRouterInput?
}

extension WelcomePagePresenter: WelcomePageModuleInput {

}

extension WelcomePagePresenter: WelcomePageViewOutput {

}

extension WelcomePagePresenter: WelcomePageInteractorOutput {

}

extension WelcomePagePresenter: WelcomePageRouterOutput {

}