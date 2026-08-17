//
//  CreateAccountViewController.swift
//  Meditatr
//
//  Created by Frank on 3/19/25.
//

import UIKit
import MyLibrary
import FirebaseAuth

class CreateAccountViewController: UIViewController {

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
    
    @IBAction func createAccountClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let error = error {
                print("Sign up error: \(error.localizedDescription)")
            } else {
                // Go to Home screen
                self.performSegue(withIdentifier: "goToNext", sender: self)
//              ContentView()
            }
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
