//
//  TabBarForEmployeesViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit



class TabBarForEmployeesViewController: UITabBarController {
    var output: TabBarForEmployeesViewOutput?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBarControllers()
        setTabBarsettings()
    }
    
}

extension TabBarForEmployeesViewController {
    private func createTabBarControllers() {
        let productsTabModule = ProductsTabModule.createModule()
        let salesTabModule = SalesTabModule.createModule()
        let checksTabModule  = ChecksTabModule.createModule()
        let settingsTabModule = SettingsTabModule.createModule()
        
        productsTabModule.view.title = "Товары"
        salesTabModule.view.title = "Продажи"
        checksTabModule.view.title = "Чеки"
        settingsTabModule.view.title = "Настройки"
        
        setViewControllers([productsTabModule.view, salesTabModule.view, checksTabModule.view, settingsTabModule.view],
                           animated: true)
        
        guard let tabBarItems = tabBar.items else {
            return
        }
        
        let tabBarImages = ["square.grid.3x3", "cart", "doc.plaintext", "gearshape"]
        
        for images in 0..<tabBarImages.count {
            tabBarItems[images].image = UIImage(systemName: tabBarImages[images])
        }
    }
    
    private func setTabBarsettings() {
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 24
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        tabBar.layer.shadowOffset = CGSize(width: -4, height: -6)
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowRadius = 20
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = AppColor.Theme.cgColor
        tabBar.tintColor = AppColor.Theme
        tabBar.unselectedItemTintColor =  UIColor.black
    }
}

extension TabBarForEmployeesViewController: TabBarForEmployeesViewInput {

}
