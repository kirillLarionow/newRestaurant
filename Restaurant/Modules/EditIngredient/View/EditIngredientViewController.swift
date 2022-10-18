//
//  EditIngredientViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 13/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit
import Then

class EditIngredientViewController: UIViewController {
    private lazy var tableView: UITableView = {
        UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorColor = AppColor.Theme
            $0.register(EditIngredientsCell.self, forCellReuseIdentifier: editIngredientsCellIdentifier)
        }
    }()
    
    var ingredients: [IngredientModel] = []
    let editIngredientsCellIdentifier = "EditIngredientsCellIdentifier"
    
    var output: EditIngredientViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        setupView()
    }
    
}

extension EditIngredientViewController {
    private func setupView() {
        view.backgroundColor = .white
        title = "Редактирование ингредиентов"
        view.addSubview(tableView)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.trailing.top.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension EditIngredientViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: editIngredientsCellIdentifier, for: indexPath)
                as? EditIngredientsCell
        else {
            fatalError()
        }
        
        cell.selectionStyle = .none
        cell.setup(ingredient: ingredients[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}

extension EditIngredientViewController: EditIngredientViewInput {
    func updateView(ingredients: [IngredientModel]) {
        self.ingredients = ingredients
        tableView.reloadData()
    }
}
