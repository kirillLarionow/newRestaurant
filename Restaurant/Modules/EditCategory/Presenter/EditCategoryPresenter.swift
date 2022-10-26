//
//  EditCategoryPresenter.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

class EditCategoryPresenter {
    var output: EditCategoryModuleOutput?
    var view: EditCategoryViewInput?
    var interactor: EditCategoryInteractorInput?
    var router: EditCategoryRouterInput?
    
    var category: CategoryModel
    
    init(category: CategoryModel) {
        self.category = category
    }
}

extension EditCategoryPresenter: EditCategoryModuleInput {

}

extension EditCategoryPresenter: EditCategoryViewOutput {
    func viewDidLoad() {
        view?.setCategoryForChange(category: category)
    }
    
    func editCategory() {
        guard
            let categoryName = view?.categoryName,
            !categoryName.isEmpty
        else {
            view?.showEditCategoryError(error: "Заполните поля!")
            return
        }
        
        let oldCategory = self.category
        interactor?.editCategory(categoryName: categoryName, oldCategory: oldCategory)
    }
    
  
}

extension EditCategoryPresenter: EditCategoryInteractorOutput {
    func udpateCategoriesList() {
        output?.udpateCategoriesList()
    }
    
    func successEditCategory() {
        view?.showEditCategorySuccess(text: "Категория успешно изменена!")
    }
}

extension EditCategoryPresenter: EditCategoryRouterOutput {

}
