//
//  ProductsListProductsListViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class ProductsListViewController: UIViewController {
    var output: ProductsListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension ProductsListViewController: ProductsListViewInput {

}
