//
//  EditIngredientPresenter.swift
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
    
    var ingredient: IngredientModel
    
    init(ingredient: IngredientModel) {
        self.ingredient = ingredient
    }
}

extension EditIngredientPresenter: EditIngredientModuleInput {

}

extension EditIngredientPresenter: EditIngredientViewOutput {
    func viewDidLoad() {
        view?.setIngredientForChange(ingredient: ingredient)
    }
    
    func editIngredient() {
        guard
            let ingredientName = view?.ingredientName,
            let ingredientCalories = view?.ingredientCalories,
            !ingredientName.isEmpty,
            !ingredientCalories.isEmpty
        else {
            view?.showEditIngredientError(error: "Заполните поля!")
            return
        }
        
        guard let ingredientCalories = Int(ingredientCalories) else {
            view?.showEditIngredientError(error: "Калории должны быть целочисленными!")
            return
        }
        
        let oldIngredient = self.ingredient
        interactor?.editIngredient(ingredientName: ingredientName, calories: ingredientCalories, oldIngredient: oldIngredient)
        view?.showEditIngredientSuccess(text: "Ингредиент успешно изменен!")
    }
    
    func closeCurrentModule() {
   
    }
}

extension EditIngredientPresenter: EditIngredientInteractorOutput {

}

extension EditIngredientPresenter: EditIngredientRouterOutput {

}
