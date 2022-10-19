//
//  IngredientsListViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 18/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit
import Then

class IngredientsListViewController: UIViewController {
    private lazy var tableView: UITableView = {
        UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorColor = AppColor.Theme
            $0.register(IngredientsListCell.self, forCellReuseIdentifier: ingredientsCellIdentifier)
        }
    }()
    
    var ingredients: [IngredientModel] = []
    let ingredientsCellIdentifier = "EditIngredientsCellIdentifier"
    
    
    var output: IngredientsListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.viewWillAppear()
        setupView()
    }
}

extension IngredientsListViewController {
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

extension IngredientsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ingredientsCellIdentifier, for: indexPath)
                as? IngredientsListCell
        else {
            fatalError()
        }
        
        cell.selectionStyle = .none
        cell.setup(ingredient: ingredients[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editIngredient = ingredients[indexPath.row]
        output?.editIngredientDidTap(editIngredient: editIngredient)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}

extension IngredientsListViewController: IngredientsListViewInput {
    func updateView(ingredients: [IngredientModel]) {
        self.ingredients = ingredients
        tableView.reloadData()
    }
    
    func updateViewAfterEditIngredient() {
        tableView.reloadData()
    }
}
