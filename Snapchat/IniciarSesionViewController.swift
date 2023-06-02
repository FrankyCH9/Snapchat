//
//  ViewController.swift
//  Snapchat
//
//  Created by Mac 12 on 31/05/23.
//

import UIKit
import FirebaseAuth
import GoogleSignIn



class IniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Google()
        // Do any additional setup after loading the view.
    }
    
    private func Google(){
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        
    }
    
    
    
    
    @IBAction func gmailTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user , error) in
            print("Intentando Iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error: \(error)")
            }else {
                print("Inicio de Sesion exitosa")
            }
            
        }
    }
    
    
    
}

