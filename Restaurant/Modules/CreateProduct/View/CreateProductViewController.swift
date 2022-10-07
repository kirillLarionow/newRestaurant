//
//  CreateProductViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit
import Then

class CreateProductViewController: UIViewController {
    //private lazy var category:
    
    
    var output: CreateProductViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Создание товара"
    }
}

extension CreateProductViewController: CreateProductViewInput {

}
