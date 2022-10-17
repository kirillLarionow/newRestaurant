//
//  EditIngredientEditIngredientPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 13/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class EditIngredientPresenter {
    var output: EditIngredientModuleOutput?
    var view: EditIngredientViewInput?
    var interactor: EditIngredientInteractorInput?
    var router: EditIngredientRouterInput?
}

extension EditIngredientPresenter: EditIngredientModuleInput {

}

extension EditIngredientPresenter: EditIngredientViewOutput {
    func viewDidLoad() {
        interactor?.getIngredients()
    }
}

extension EditIngredientPresenter: EditIngredientInteractorOutput {
    func fetchIngredientsData(ingredients: [IngredientModel]) {
        view?.updateView(ingredients: ingredients)
    }
}

extension EditIngredientPresenter: EditIngredientRouterOutput {

}
