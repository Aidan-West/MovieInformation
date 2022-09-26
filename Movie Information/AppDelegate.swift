//
//  AppDelegate.swift
//  Movie Information
//
//  Created by Ege on 21.09.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureWindow(destinationVC: ViewController())
        return true
    }
    
    func configureWindow(destinationVC : ViewController){
        
      
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        window?.rootViewController = destinationVC
        
        
    }
}
