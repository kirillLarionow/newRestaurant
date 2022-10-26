//
//  CreateIngredientCreateIngredientPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 12/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class CreateIngredientPresenter {
    var output: CreateIngredientModuleOutput?
    var view: CreateIngredientViewInput?
    var interactor: CreateIngredientInteractorInput?
    var router: CreateIngredientRouterInput?
}

extension CreateIngredientPresenter: CreateIngredientModuleInput {

}

extension CreateIngredientPresenter: CreateIngredientViewOutput {
    func createIngredient() {
        guard
            let ingredientName = view?.ingredientName,
            let ingredientCalories = view?.ingredientCalories,
            !ingredientName.isEmpty,
            !ingredientCalories.isEmpty
        else {
            view?.showCreateIngredientError(error: "Заполните поля!")
            return
        }
        
        guard let ingredientCalories = Int(ingredientCalories) else {
            view?.showCreateIngredientError(error: "Калории должны быть целочисленными!")
            return
        }
        
        interactor?.createIngredient(ingredientName: ingredientName, calories: ingredientCalories)
    }
    
    func closeCurrentModule() {
        guard let navigationController = view?.navigationController else {
            return
        }
        
        router?.closeCurrentModule(navigationController: navigationController)
    }
}

extension CreateIngredientPresenter: CreateIngredientInteractorOutput {
    func successCreateIngredient() {
        view?.showCreateIngredientSuccess(text: "Ингредиент успешно создан!")
    }
}

extension CreateIngredientPresenter: CreateIngredientRouterOutput {

}
