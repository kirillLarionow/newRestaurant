//
//  SalesTabSalesTabViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class SalesTabViewController: UIViewController {
    var output: SalesTabViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension SalesTabViewController: SalesTabViewInput {

}
