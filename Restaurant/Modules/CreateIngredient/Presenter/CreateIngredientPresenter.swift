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

}

extension CreateIngredientPresenter: CreateIngredientInteractorOutput {

}

extension CreateIngredientPresenter: CreateIngredientRouterOutput {

}