//
//  IngredientsListIngredientsListPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class IngredientsListPresenter {
    var output: IngredientsListModuleOutput?
    var view: IngredientsListViewInput?
    var interactor: IngredientsListInteractorInput?
    var router: IngredientsListRouterInput?
}

extension IngredientsListPresenter: IngredientsListModuleInput {

}

extension IngredientsListPresenter: IngredientsListViewOutput {
    func viewDidLoad() {
        interactor?.getIngredients()
    }
    
    func editIngredientDidTap(editIngredient: IngredientModel) {
        guard let navigationController = view?.navigationController else {
            return
        }
                
        router?.goToEditIngredientModule(editIngredient: editIngredient, navigationController: navigationController)
        print(editIngredient)
    }
}

extension IngredientsListPresenter: IngredientsListInteractorOutput {
    func fetchIngredientsData(ingredients: [IngredientModel]) {
        view?.updateView(ingredients: ingredients)
    }
}

extension IngredientsListPresenter: IngredientsListRouterOutput {

}
