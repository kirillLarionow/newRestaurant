//
//  AppDelegate.swift
//  Restaurant
//
//  Created by кирилл ларионов on 01.09.2022.
//

import UIKit
import FirebaseCore
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableDebugging = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.shouldPlayInputClicks = true
        
        let welcomePageKey = UserDefaults.standard.bool(forKey: "welcomePage")
        if welcomePageKey {
            let loginPageModule = LoginPageModule.createModule()
            window?.rootViewController = loginPageModule.view
        } else {
            let welcomePageModule = WelcomePageModule.createModule()
            window?.rootViewController = welcomePageModule.view
        }
   
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }
}

