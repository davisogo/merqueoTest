//
//  LoginViewController.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/27/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: LoginTextField!
    @IBOutlet var passwordTextfield: LoginTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onLoginButtonTap(_ sender: Any) {
        performLogin()
    }
    
    func performLogin(){
        let email = self.emailTextField.text ?? "" //"prueba@prueba.com"
        let password = self.passwordTextfield.text ?? "" //"prueba1234"
        
        if email.isEmpty || password.isEmpty {
            presentAlertView(withErrorMessage: "Los datos están incompletos")
        }
        UserSessionServices.sharedInstance.performLoginAttempt(email: email, password: password) { (jsonDictionary, error, loginResult)->() in
            print("Login result: \(String(describing: loginResult))")
            if(loginResult != LoginErrorEnum.ReadyToGo){
                switch loginResult!{
                case LoginErrorEnum.ErrorOnLogin:
                    self.presentAlertView(withErrorMessage: "Revisa los datos ingresados")
                    break
                default:
                    self.presentAlertView(withErrorMessage: "Revisa tu conexión de internet")
                    break
                }
            }else{
                self.performSegue(withIdentifier: "goToHomeSegue", sender: nil)
            }
        }
    }
    
    func presentAlertView(withErrorMessage message:String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
            print("Okay")
        }))
        self.present(alert, animated: true) {}
    }
}
