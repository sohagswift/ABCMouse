//
//  AppDelegate.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 20/1/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        TStorage.VarifyParent = false
       
        Bundle.setLanguage(TStorage.wordFocus)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


struct Kid {
    private enum Keys {
        static let level1Prograss = "level1Prograss"
    }
    
    static var L1prograss: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.level1Prograss)
            UserDefaults.standard.synchronize()
        }
        
        get {
            return UserDefaults.standard.integer(forKey: Keys.level1Prograss)
        }
    }
}
