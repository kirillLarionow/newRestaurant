//
//  CreateCategoryCreateCategoryPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class CreateCategoryPresenter {
    var output: CreateCategoryModuleOutput?
    var view: CreateCategoryViewInput?
    var interactor: CreateCategoryInteractorInput?
    var router: CreateCategoryRouterInput?
}

extension CreateCategoryPresenter: CreateCategoryModuleInput {

}

extension CreateCategoryPresenter: CreateCategoryViewOutput {
    func createCategory() {
        guard
            let categoryName = view?.categoryName,
            !categoryName.isEmpty
        else {
            view?.showCreateCategoryError(error: "Заполните поля!")
            return
        }
        
        interactor?.createCategory(categoryName: categoryName)
    }
    
    func closeCurrentModule() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.closeCurrentModule(navigationController: navigationController)
    }
}

extension CreateCategoryPresenter: CreateCategoryInteractorOutput {
    func successCreateCategory() {
        view?.showCreateCategorySuccess(text: "Категория успешно создана!")
    }
}

extension CreateCategoryPresenter: CreateCategoryRouterOutput {

}
