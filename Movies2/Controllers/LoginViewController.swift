//
//  LoginViewController.swift
//  Movies2
//
//  Created by Nikhil Iyer on 7/23/18.
//  Copyright © 2018 Nikhil Iyer. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: Any) {
        //self.performSegue(withIdentifier: "loginSegue", sender: self)
        
        if(emailTextField.text != "" && passwordTextField.text != "")
        {
            DataService.instance.signInOrRegister(completion: { (data) in
                if(data){
                   self.performSegue(withIdentifier: "loginSegue", sender: self)
                } else{
                    self.alertcontrollerDisplay(message: "Could not sign in. Please make sure your email and password are correct")
                }
            }, email: emailTextField.text!, password: passwordTextField.text!, signInOrNot: true)
        }
        else{
            self.alertcontrollerDisplay(message: "Please enter username or password")
        }

    }
    @IBAction func register(_ sender: Any) {
        if(emailTextField.text! == ""){
            self.alertcontrollerDisplay(message: "Please enter an email address")
        } else if(passwordTextField.text! == ""){
            self.alertcontrollerDisplay(message: "Please enter a password")
        } else{
            DataService.instance.signInOrRegister(completion: { (data) in
                if(data){
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                } else{
                    self.alertcontrollerDisplay(message: "Cannot register user")
                }
            }, email: emailTextField.text!, password: passwordTextField.text!, signInOrNot: false)
        }
    }
    
    func alertcontrollerDisplay(message: String){
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
