//
//  WelcomePageWelcomePageViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 01/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit

class WelcomePageViewController: UIViewController {
    lazy private var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    var output: WelcomePageViewOutput?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(contentView)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        contentView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}

extension WelcomePageViewController: WelcomePageViewInput {

}
