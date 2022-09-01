//
//  AppDelegate.swift
//  Restaurant
//
//  Created by кирилл ларионов on 01.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let welcomePageModule = WelcomePageModule.createModule()
        let navigationController = UINavigationController(rootViewController: welcomePageModule.view)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

