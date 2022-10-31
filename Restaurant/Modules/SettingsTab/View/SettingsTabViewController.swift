//
//  SettingsTabViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 28/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit

class SettingsTabViewController: UIViewController {
    var output: SettingsTabViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension SettingsTabViewController: SettingsTabViewInput {

}
