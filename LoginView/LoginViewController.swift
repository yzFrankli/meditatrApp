//
//  LoginViewController.swift
//  Meditatr
//
//  Created by Frank on 3/19/25.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneclick))
        toolbar.setItems([doneButton], animated: false)
        emailTextField.inputAccessoryView = toolbar
        passwordTextField.inputAccessoryView = toolbar


        // Do any additional setup after loading the view.
    }
    
    @objc func doneclick() {
        self.view.endEditing(true)
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        
        
        guard let email = emailTextField.text, !email.isEmpty,
        let password = passwordTextField.text, !password.isEmpty else {
            print("email/pass is empty")
            return }


        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                print("Login Error: \(error.localizedDescription)")
                return
            }

            self.performSegue(withIdentifier: "goToNext", sender: self)
            
//                    loginSuccess { (result, error) in
//                        if result {
//                            self.performSegue(withIdentifier: "goToNext", sender: self)
//                    } else {
//                        print("error")
//                    }
//            
//
//                    }
//            
        }
    
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

