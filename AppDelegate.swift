//
//  AppDelegate.swift
//  Restaurant
//
//  Created by кирилл ларионов on 01.09.2022.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let welcomePageKey = UserDefaults.standard.bool(forKey: "welcomePage")
        if welcomePageKey {
            let loginPageModule = LoginPageModule.createModule()
            let navigationController = UINavigationController(rootViewController: loginPageModule.view)
            window?.rootViewController = navigationController
        } else {
            let welcomePageModule = WelcomePageModule.createModule()
            window?.rootViewController = welcomePageModule.view
        }
   
        
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }
}

