//
//  RegistrationPageRegistrationPagePresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 08/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class RegistrationPagePresenter {
    var output: RegistrationPageModuleOutput?
    var view: RegistrationPageViewInput?
    var interactor: RegistrationPageInteractorInput?
    var router: RegistrationPageRouterInput?
}

extension RegistrationPagePresenter: RegistrationPageModuleInput {

}

extension RegistrationPagePresenter: RegistrationPageViewOutput {
    func successRegistration() {
        guard let navigationController = view?.navigationController else {
            fatalError("нет навигейшн контроллера")
        }
        
        router?.closeRegistrationPage(navigationController: navigationController)
    }
}

extension RegistrationPagePresenter: RegistrationPageInteractorOutput {

}

extension RegistrationPagePresenter: RegistrationPageRouterOutput {

}
