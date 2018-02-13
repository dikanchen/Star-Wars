//
//  ViewController.swift
//  LoginExample
//
//  Created by User on 2/9/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper

enum LoginErrors:Error{
    case passwordShort
    case notEmail
}
class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameText.delegate = self
        passwordText.delegate = self
        guard let userName = UserDefaults.standard.object(forKey: Constants.kUserName) as? String else{return}
        usernameText.text = userName
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func logIn(email:String, pass:String)throws{
        guard pass.count >= 6 else{throw LoginErrors.passwordShort}
        guard email.isValidEmail() else{throw LoginErrors.notEmail}
        Auth.auth().signIn(withEmail: email, password: pass){
            (user, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let user = user else{return}
            print(user.uid)
            let userDefaults = UserDefaults.standard
            userDefaults.set(email, forKey:Constants.kUserName)
            self.performSegue(withIdentifier: "toCongrats", sender: nil)
        }
    }

    @IBAction func signIn(_ sender:Any){
        guard let userName = usernameText.text else {return}
        guard let password = passwordText.text else {return}
        //guard checkEmailPass(email: userName, pass: password)
        do{
            try logIn(email: userName, pass: password)
        }catch let error{
            print(error.localizedDescription)
            createAlert(title: "Login Failed", message: "Username or password not correct")
        }
    }
    
    func createAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
}

typealias TextFieldFunctions = ViewController
extension TextFieldFunctions:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string:String) -> Bool{
        switch textField{
        case passwordText:
            guard string == "\n" else {return true}
            textField.resignFirstResponder()
            self.signIn(textField)
            return false
        default:
            let characters = "\n\t^%$#!&*()_-+=[]{}|"
            guard characters.contains(string) else {return true}
            guard string == "\n" else {return false}
            textField.resignFirstResponder()
            passwordText.becomeFirstResponder()
            return false
            
        }
    }
}
