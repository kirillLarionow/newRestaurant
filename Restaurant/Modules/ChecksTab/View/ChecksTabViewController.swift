//
//  ChecksTabChecksTabViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class ChecksTabViewController: UIViewController {
    var output: ChecksTabViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension ChecksTabViewController: ChecksTabViewInput {

}
