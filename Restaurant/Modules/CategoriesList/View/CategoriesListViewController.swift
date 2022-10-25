//
//  CategoriesListViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import RxGesture
import RxBinding

class CategoriesListModel {
    let category: CategoryModel
    var isSelected: Bool = false
    
    init(category: CategoryModel) {
        self.category = category
    }
}

class CategoriesListViewController: UIViewController {
    private lazy var mainStackView: UIStackView = {
        UIStackView().then {
            $0.axis = .vertical
            
            $0.addArrangedSubview(choiceStateStackViewHeader)
            $0.addArrangedSubview(tableView)
            $0.addArrangedSubview(confirmCategoryButton)
        }
    }()
    
    private lazy var choiceStateStackViewHeader: UIStackView = {
        UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 16
            $0.addArrangedSubview(closeCategoryMenuButton)
            $0.addArrangedSubview(titleForChoiceStateLabel)
            $0.isHidden = true
        }
    }()
    
    private lazy var titleForChoiceStateLabel: UILabel = {
        UILabel().then {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 18, weight: .medium)
            $0.text = "Выбор категории"
            $0.textAlignment = .left
        }
    }()
    
    private lazy var closeCategoryMenuButton: UIButton = {
        UIButton(type: .system).then {
            $0.setTitle("Назад", for: .normal)
            $0.setTitleColor(AppColor.Theme, for: .normal)
            $0.backgroundColor = UIColor.white
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
            $0.rx
                .tapGesture()
                .when(.recognized)
                .subscribe(onNext: { _ in
                    print("categories did close")
                    self.dismiss(animated: true)
                })
                .disposed(by: disposeBag)
        }
    }()
    
    private lazy var tableView: UITableView = {
        UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorColor = AppColor.Theme
            $0.allowsMultipleSelection = false
            $0.register(CategoriesListCell.self, forCellReuseIdentifier: categoriesCellIdentifier)
        }
    }()
    
    private lazy var confirmCategoryButton: UIButton = {
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
                    print("Confirm category did tap")
                    self.dismiss(animated: true)
                    self.output?.confirmCategoryButtonDidTap()
                })
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
    
    var categories: [CategoriesListModel] = []
    let categoriesCellIdentifier = "CategoriesListCellIdentifier"
    var categoriesListState: CategoriesListState = .normal
    
    let disposeBag = DisposeBag()
    var output: CategoriesListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        setupView()
    }
}

extension CategoriesListViewController {
    private func setupView() {
        view.backgroundColor = .white
        title = "Редактирование категории"
        view.addSubview(mainStackView)
        view.addSubview(errorLabel)
        
        switch categoriesListState {
        case .normal:
            if categories.count == 0 {
                errorLabel.isHidden = false
                errorLabel.text = "Создайте категорию или обновите страницу!"
                mainStackView.isHidden = true
                choiceStateStackViewHeader.isHidden = true
            } else {
                errorLabel.isHidden = true
                mainStackView.isHidden = false
                choiceStateStackViewHeader.isHidden = true
            }
        case .choice:
            if categories.count == 0 {
                errorLabel.isHidden = false
                errorLabel.text = "Создайте категорию или обновите страницу!"
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
        switch categoriesListState {
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
            
            confirmCategoryButton.snp.makeConstraints { make in
                make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
                make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-15)
                make.height.equalTo(50)
            }
            
            closeCategoryMenuButton.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(40)
            }
            
            errorLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
            }
        }
    }
}

extension CategoriesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch categoriesListState {
        case .normal:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: categoriesCellIdentifier, for: indexPath)
                    as? CategoriesListCell
            else {
                fatalError()
            }
            
            let category = categories[indexPath.row]
            cell.setup(category: category)
            cell.selectionStyle = .none
            
            return cell
            
        case .choice:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: categoriesCellIdentifier, for: indexPath)
                    as? CategoriesListCell
            else {
                fatalError()
            }
            
            let category = categories[indexPath.row]
            cell.setup(category: category)
            cell.selectionStyle = .none
            
            self.confirmCategoryButton.isHidden = false
            self.choiceStateStackViewHeader.isHidden = false
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch categoriesListState {
        case .normal:
            let editCategory = categories[indexPath.row].category
            output?.editCategoryDidTap(editCategory: editCategory)
        case .choice:
            let selectedCategories = categories
            selectedCategories.forEach({ $0.isSelected = false })
            let selectedCategory = selectedCategories[indexPath.row]
            selectedCategory.isSelected = true
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        switch categoriesListState {
        case .normal:
           break
        case .choice:
            let selectedCategories = categories
            selectedCategories.forEach({ $0.isSelected = false })
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}

extension CategoriesListViewController: CategoriesListViewInput {
    var category: CategoryModel? {
        switch categoriesListState {
        case .normal:
            return nil
        case .choice:
            let category = categories.first(where: { $0.isSelected })
            return category?.category
        }
    }
    
    func updateView(categories: [CategoryModel], categoriesListState: CategoriesListState) {
        self.categories = categories.map { CategoriesListModel(category: $0) }
        self.categoriesListState = categoriesListState
        setupView()
        tableView.reloadData()
    }
}
