//
//  ProductsListViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import Then
import SnapKit

class ProductsListViewController: UIViewController {
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped).then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorColor = AppColor.Theme
            $0.register(ProductsListTableViewCell.self, forCellReuseIdentifier: productsListTableViewCellID)
        }
    }()
    
    private let productsListTableViewCellID = "ProductsListTableViewCell"
   
    
    var products: [ProductModel]? = []
    
    var output: ProductsListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        setupView()
    }
}

extension ProductsListViewController {
    private func setupView() {
        view.backgroundColor = .white
        title = "Список всех товаров"
        view.addSubview(tableView)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: productsListTableViewCellID, for: indexPath)
                as? ProductsListTableViewCell
        else {
            fatalError()
        }
        
        guard let productModel = products?[indexPath.row] else {
            fatalError()
        }
        
        cell.setup(productModel: productModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(250)
    }
}

extension ProductsListViewController: ProductsListViewInput {
    func updateView(products: [ProductModel]) {
        self.products = products
        tableView.reloadData()
    }
}
