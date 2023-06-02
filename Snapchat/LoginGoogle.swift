//
//  LoginGoogle.swift
//  Snapchat
//
//  Created by Mac 12 on 1/06/23.
//

import Foundation
import UIKit
import FirebaseAuth
import GoogleSignIn

extension IniciarSesionViewController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error  = error{
            print("Error debido a: \(error.localizedDescription)")
            return
        }
        
        guard let auth = user.authentication else {return}
        let credentails  = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentails) {(authResult , error ) in
            if let error = error {
                print("Error debido a: \(error.localizedDescription)")
                return
            }
            
            print("Logeo de manera Correcta con firebase")
        }
    }
    
   
    
    
}
