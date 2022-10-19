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

class CategoriesListViewController: UIViewController {
    private lazy var tableView: UITableView = {
        UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorColor = AppColor.Theme
            $0.register(CategoriesListCell.self, forCellReuseIdentifier: categoriesCellIdentifier)
        }
    }()
    
    var categories: [CategoryModel] = []
    let categoriesCellIdentifier = "CategoriesListCellIdentifier"
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
        view.addSubview(tableView)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.trailing.top.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension CategoriesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: categoriesCellIdentifier, for: indexPath)
                as? CategoriesListCell
        else {
            fatalError()
        }
        
        cell.selectionStyle = .none
        cell.setup(category: categories[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editCategory = categories[indexPath.row]
        output?.editCategoryDidTap(editCategory: editCategory)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}

extension CategoriesListViewController: CategoriesListViewInput {
    func updateView(categories: [CategoryModel]) {
        self.categories = categories
        tableView.reloadData()
    }
}
