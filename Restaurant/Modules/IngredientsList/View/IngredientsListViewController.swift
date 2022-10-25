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
import RxCocoa
import RxSwift
import RxGesture
import RxBinding

class IngredientsListModel {
    let ingredient: IngredientModel
    var isSelected: Bool = false
    
    init(ingredient: IngredientModel) {
        self.ingredient = ingredient
    }
}

class IngredientsListViewController: UIViewController {
    private lazy var mainStackView: UIStackView = {
        UIStackView().then {
            $0.axis = .vertical
            $0.addArrangedSubview(choiceStateStackViewHeader)
            $0.addArrangedSubview(tableView)
            $0.addArrangedSubview(confirmIngredientsButton)
        }
    }()
    
    private lazy var errorStackView: UIStackView = {
        UIStackView().then {
            $0.axis = .vertical
            $0.addArrangedSubview(errorStateStackViewHeader)
            $0.addArrangedSubview(errorLabel)
        }
    }()
    
    private lazy var errorLabel: UILabel = {
        UILabel().then {
            $0.textColor = UIColor.gray
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.isHidden = true
            $0.numberOfLines = 0
            $0.textAlignment = .center
        }
    }()
    
    private lazy var errorStateStackViewHeader: UIStackView = {
        UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 16
           // $0.addArrangedSubview(closeIngredientsMenuButton)
           // $0.addArrangedSubview(titleForChoiceStateLabel)
            $0.isHidden = true
        }
    }()
    
    private lazy var choiceStateStackViewHeader: UIStackView = {
        UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 16
            $0.addArrangedSubview(closeIngredientsMenuButton)
            $0.addArrangedSubview(titleForChoiceStateLabel)
            $0.isHidden = true
        }
    }()
    
    private lazy var titleForChoiceStateLabel: UILabel = {
        UILabel().then {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 18, weight: .medium)
            $0.text = "Выбор ингредиентов"
            $0.textAlignment = .left
        }
    }()
    
    private lazy var closeIngredientsMenuButton: UIButton = {
        UIButton(type: .system).then {
            $0.setTitle("Назад", for: .normal)
            $0.setTitleColor(AppColor.Theme, for: .normal)
            $0.backgroundColor = UIColor.white
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
            $0.rx
                .tapGesture()
                .when(.recognized)
                .subscribe(onNext: { _ in
                    print("ingredients did close")
                    self.dismiss(animated: true)
                })
                .disposed(by: disposeBag)
        }
    }()
    
    private lazy var confirmIngredientsButton: UIButton = {
        UIButton(type: .system).then {
            $0.setTitle("Подтвердить", for: .normal)
            $0.setTitleColor(UIColor.white, for: .normal)
            $0.backgroundColor = AppColor.Theme
            $0.layer.cornerRadius = 6
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.isHidden = true
            $0.rx
                .tapGesture()
                .when(.recognized)
                .subscribe(onNext: { _ in
                    print("Confirm ingredients did tap")
                    self.dismiss(animated: true)
                    self.output?.confirmCategoryButtonDidTap()
                })
        }
    }()

    
    private lazy var tableView: UITableView = {
        UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorColor = AppColor.Theme
            $0.register(IngredientsListCell.self, forCellReuseIdentifier: ingredientsCellIdentifier)
        }
    }()
    
    var ingredientsListState: IngredientsListState = .normal
    var ingredients: [IngredientsListModel] = []
    var selectedIngredients: [IngredientModel] = []
    
    let ingredientsCellIdentifier = "EditIngredientsCellIdentifier"
    let disposeBag = DisposeBag()
    
    
    var output: IngredientsListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        setupView()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.viewWillAppear()
        
    }
}

extension IngredientsListViewController {
    private func setupView() {
        view.backgroundColor = .white
        title = "Редактирование ингредиентов"
        view.addSubview(mainStackView)
        view.addSubview(errorLabel)
    
        switch ingredientsListState {
        case .normal:
            if ingredients.count == 0 {
                errorLabel.isHidden = false
                errorLabel.text = "Создайте ингредиент или обновите страницу!"
                mainStackView.isHidden = true
                choiceStateStackViewHeader.isHidden = true
            } else {
                errorLabel.isHidden = true
                mainStackView.isHidden = false
                choiceStateStackViewHeader.isHidden = true
            }
        case .choice:
            if ingredients.count == 0 {
                errorLabel.isHidden = false
                errorLabel.text = "Создайте ингредиент или обновите страницу!"
                mainStackView.isHidden = true
                choiceStateStackViewHeader.isHidden = false
            } else {
                errorLabel.isHidden = true
                mainStackView.isHidden = false
                choiceStateStackViewHeader.isHidden = false
            }
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        switch ingredientsListState {
        case .normal:
            mainStackView.snp.makeConstraints { make in
                make.trailing.top.leading.bottom.equalTo(view.safeAreaLayoutGuide)
            }
            
            errorLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
            }
        case .choice:
            mainStackView.snp.makeConstraints { make in
                make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
                make.top.equalTo(view.safeAreaLayoutGuide).inset(15)
            }
            
            confirmIngredientsButton.snp.makeConstraints { make in
                make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
                make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-15)
                make.height.equalTo(50)
            }
            
            closeIngredientsMenuButton.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(40)
            }
            
            errorLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
            }
        }
    }
    
    private func getSelectedIngredients() -> [IngredientModel] {
        selectedIngredients.removeAll()
        ingredients.forEach { ingredient in
            if ingredient.isSelected {
                selectedIngredients.append(ingredient.ingredient)
            }
        }
        
        return selectedIngredients
    }
}

extension IngredientsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ingredientsListState {
        case .normal:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: ingredientsCellIdentifier, for: indexPath)
                    as? IngredientsListCell
            else {
                fatalError()
            }
            
            cell.selectionStyle = .none
            cell.setup(ingredient: ingredients[indexPath.row])
            
            return cell
        case .choice:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: ingredientsCellIdentifier, for: indexPath)
                    as? IngredientsListCell
            else {
                fatalError()
            }
            
            cell.selectionStyle = .none
            cell.setup(ingredient: ingredients[indexPath.row])
            
            self.confirmIngredientsButton.isHidden = false
            self.choiceStateStackViewHeader.isHidden = false
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch ingredientsListState {
        case .normal:
            let editIngredient = ingredients[indexPath.row].ingredient
            output?.editIngredientDidTap(editIngredient: editIngredient)
        case .choice:
         
            let selectedIngredients = ingredients
            let selectedIngredient = selectedIngredients[indexPath.row]
            
            if selectedIngredient.isSelected {
                selectedIngredient.isSelected = false
            } else {
                selectedIngredient.isSelected = true
            }
           
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}

extension IngredientsListViewController: IngredientsListViewInput {
    var ingredientsForCreateproduct: [IngredientModel]? {
        switch ingredientsListState {
        case .normal:
            return nil
        case .choice:
            return getSelectedIngredients()
        }
    }
    
    func updateView(ingredients: [IngredientModel], ingredientsListState: IngredientsListState) {
        self.ingredients = ingredients.map({ IngredientsListModel(ingredient: $0) })
        self.ingredientsListState = ingredientsListState
        setupView()
        tableView.reloadData()
    }
}
