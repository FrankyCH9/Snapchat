//
//  AppDelegate.swift
//  Snapchat
//
//  Created by Mac 12 on 31/05/23.
//

import UIKit
import FirebaseCore
//import Firebase
import GoogleSignIn


@main
class AppDelegate: UIResponder, UIApplicationDelegate  {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        // Configuración de Google SignIn
        
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        
      
        
        
                
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let handle = GIDSignIn.sharedInstance().handle(url)
        return handle
    }
    

    
    
    
    
    
    
    
    /*
    func sign(_ signIn: GIDSignIn!, didSignForuser:GIDGoogleUser!, withError error: Error! ){
        print("User email: \(user.profile.email ?? "No Email")" )
    }*/

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

