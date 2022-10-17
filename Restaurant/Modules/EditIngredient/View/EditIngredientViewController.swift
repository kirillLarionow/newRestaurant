//
//  EditIngredientViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 13/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit

class EditIngredientViewController: UIViewController {
    let testButton: UIButton = {
        let testButton = UIButton(type: .system)
        testButton.setTitle("123", for: .normal)
        testButton.backgroundColor = .white
        testButton.setTitleColor(.black, for: .normal)
        testButton.addTarget(self, action: #selector(testButtonDidTap), for: .touchUpInside)
        return testButton
    }()
    
    
    var output: EditIngredientViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testButton)
        
        output?.viewDidLoad()
        
        view.backgroundColor = .red
        
        testButton.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc func testButtonDidTap() {
        output?.testButtonDidTap()
    }
}

extension EditIngredientViewController: EditIngredientViewInput {

}
