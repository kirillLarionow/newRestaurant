//
//  ProductsTabProductsTabViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import Then

class ProductsTabViewController: UIViewController {
    private lazy var tableView: UIView = {
        UITableView(frame: .zero, style: .insetGrouped).then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorColor = AppColor.Theme
            $0.register(ProductsCell.self, forCellReuseIdentifier: productsCellID)
        }
    }()
    
    let productsCellID = "ProductsCell"
    var output: ProductsTabViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Товары"
        setupView()
    }
}

extension ProductsTabViewController {
    func setupView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension ProductsTabViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: productsCellID, for: indexPath) as? ProductsCell else {
            fatalError()
        }
        
        switch indexPath.row {
        case 0:
            cell.setup(text: "Просмотреть весь список товаров")
        case 1:
            cell.setup(text: "Создать товар")
        case 2:
            cell.setup(text: "Создать категорию")
        case 3:
            cell.setup(text: "Редактировать товар")
        case 4:
            cell.setup(text: "Редактировать категорию")
        case 5:
            cell.setup(text: "Создать ингредиент")
        case 6:
            cell.setup(text: "Редактировать ингредиент")
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            output?.productListDidTap()
        case 1:
            output?.createProductDidTap()
        case 2:
           break
        case 3:
            break
        case 4:
           break
        case 5:
            output?.createIngredientDidTap()
        case 6:
            output?.editIngredientDidTap()
        default:
            break
        }
    }
}

extension ProductsTabViewController: ProductsTabViewInput {

}
