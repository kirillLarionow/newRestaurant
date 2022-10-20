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

enum CategoriesListState {
    case normal
    case choice
}

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
            $0.addArrangedSubview(tableView)
            $0.addArrangedSubview(confirmCategoryButton)
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
        }
    }()
    
    var categories: [CategoriesListModel] = []
    let categoriesCellIdentifier = "CategoriesListCellIdentifier"
    var categoriesListState: CategoriesListState = .normal
    
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
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.trailing.top.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        confirmCategoryButton.snp.makeConstraints { make in
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(50)
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
    func updateView(categories: [CategoryModel], categoriesListState: CategoriesListState) {
        self.categories = categories.map { CategoriesListModel(category: $0) }
        self.categoriesListState = categoriesListState
        tableView.reloadData()
    }
}
