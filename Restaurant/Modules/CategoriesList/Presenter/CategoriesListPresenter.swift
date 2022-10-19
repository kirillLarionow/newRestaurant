//
//  CategoriesListPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class CategoriesListPresenter {
    var output: CategoriesListModuleOutput?
    var view: CategoriesListViewInput?
    var interactor: CategoriesListInteractorInput?
    var router: CategoriesListRouterInput?
    
    var categories: [CategoryModel] = []
}

extension CategoriesListPresenter: CategoriesListModuleInput {

}

extension CategoriesListPresenter: CategoriesListViewOutput {
    func viewDidLoad() {
        interactor?.getCategories()
    }
    
//    func viewWillAppear() {
//        interactor?.getIngredients()
//    }
    
    func editCategoryDidTap(editCategory: CategoryModel) {
        guard let navigationController = view?.navigationController else {
            return
        }
                
        router?.goToEditCategoryModule(editCategory: editCategory, navigationController: navigationController)
        print(editCategory)
    }
}

extension CategoriesListPresenter: CategoriesListInteractorOutput {
    func fetchCategorieData(categories: [CategoryModel]) {
        view?.updateView(categories: categories)
    }
}

extension CategoriesListPresenter: CategoriesListRouterOutput {
    func updateCategoriesList() {
        interactor?.getCategories()
        view?.updateView(categories: categories)
    }
}

