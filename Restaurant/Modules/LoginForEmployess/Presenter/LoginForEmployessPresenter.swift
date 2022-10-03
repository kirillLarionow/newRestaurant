//
//  LoginForEmployessLoginForEmployessPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 03/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class LoginForEmployessPresenter {
    var output: LoginForEmployessModuleOutput?
    var view: LoginForEmployessViewInput?
    var interactor: LoginForEmployessInteractorInput?
    var router: LoginForEmployessRouterInput?
}

extension LoginForEmployessPresenter: LoginForEmployessModuleInput {

}

extension LoginForEmployessPresenter: LoginForEmployessViewOutput {

}

extension LoginForEmployessPresenter: LoginForEmployessInteractorOutput {

}

extension LoginForEmployessPresenter: LoginForEmployessRouterOutput {

}