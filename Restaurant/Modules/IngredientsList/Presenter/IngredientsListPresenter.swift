//
//  IngredientsListPresenter.swift
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
    
    var ingredients: [IngredientModel] = []
    
    var ingredientsListState: IngredientsListState
    
    init(ingredientsListState: IngredientsListState) {
        self.ingredientsListState = ingredientsListState
    }
}

extension IngredientsListPresenter: IngredientsListModuleInput {

}

extension IngredientsListPresenter: IngredientsListViewOutput {
    func viewDidLoad() {
        interactor?.getIngredients()
    }
    
    func viewWillAppear() {
        interactor?.getIngredients()
    }
    
    func editIngredientDidTap(editIngredient: IngredientModel) {
        guard let navigationController = view?.navigationController else {
            return
        }
                
        router?.goToEditIngredientModule(editIngredient: editIngredient, navigationController: navigationController)
        print(editIngredient)
    }
    
    func confirmCategoryButtonDidTap() {
        guard let ingredients = view?.ingredientsForCreateproduct else {
            return
        }
        
        output?.setupIngredientsToCreateProduct(ingredients: ingredients)
        print(ingredients)
    }
}

extension IngredientsListPresenter: IngredientsListInteractorOutput {
    func fetchIngredientsData(ingredients: [IngredientModel]) {
        view?.updateView(ingredients: ingredients, ingredientsListState: ingredientsListState)
    }
}

extension IngredientsListPresenter: IngredientsListRouterOutput {
    func updateIngredientsList() {
        interactor?.getIngredients()
        view?.updateView(ingredients: ingredients, ingredientsListState: ingredientsListState)
    }
}

