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
//        "email": "prueba@prueba.com",
//        "password": "prueba1234"
        let email = "prueba@prueba.com"
        let password = "prueba1234"
        UserSessionServices.sharedInstance.performLoginAttempt(email: email, password: password) { (resultString) in
            print("Login result: \(resultString)")
        }
    }
}
