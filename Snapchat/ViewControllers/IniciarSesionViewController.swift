//
//  ViewController.swift
//  Snapchat
//
//  Created by Mac 12 on 31/05/23.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FirebaseDatabase



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
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!,completion: {(user ,error) in
                    print("Intentando crear un usuario")
                    if error != nil{
                        print("Se presento el siguiente error al crear el usuario: \(error)")
                    }else {
                        print("El usuario fue creado exitosamente")
                        
                        Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                        
                        let alerta = UIAlertController(title: "creacion de usuario: ", message: "usuario \(self.emailTextField.text!) se creo correctamente", preferredStyle: .alert)
                        let btnOK =  UIAlertAction(title: "aceptar", style: .default, handler:
                            { (UIAlertAction) in
                            self.performSegue(withIdentifier: "inisiarsesionsegue", sender: nil)
                        })
                        alerta.addAction(btnOK)
                        self.present(alerta, animated: true,completion: nil)
                        
                    }
                })
            }else {
                print("Inicio de Sesion exitosa")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
            
        }
    }
    
    
    
}

