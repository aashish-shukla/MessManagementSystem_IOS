//
//  signupViewController.swift
//  SarvahaarMess
//
//  Created by Aashish Shukla on 01/05/25.
//

import UIKit

class signupViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var regNoTextField: UITextField!
    
    
    @IBOutlet weak var contactTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.isEnabled = false
                [nameTextField, regNoTextField, contactTextField, passwordTextField].forEach {
                    $0?.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
                }

        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldsChanged() {
            let filled = !(nameTextField.text?.isEmpty ?? true) &&
                         !(regNoTextField.text?.isEmpty ?? true) &&
                         !(contactTextField.text?.isEmpty ?? true) &&
                         !(passwordTextField.text?.isEmpty ?? true)

            signUpButton.isEnabled = filled
        }
    
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
            let regNo = regNoTextField.text ?? ""
            let contact = contactTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            
            // Store user details
            UserDefaults.standard.set(name, forKey: "userName")
            UserDefaults.standard.set(password, forKey: "userPassword")
            UserDefaults.standard.set(regNo, forKey: "userRegNo")
            UserDefaults.standard.set(contact, forKey: "userContact")
            
            // Show success alert and go to sign in screen
            let alert = UIAlertController(title: "Sign Up Successful", message: "You can now log in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                if let signinVC = self.storyboard?.instantiateViewController(withIdentifier: "Signin") as? ViewController {
                    signinVC.modalPresentationStyle = .fullScreen
                    self.present(signinVC, animated: true)
                }
            })
            present(alert, animated: true)
    }
    
    

    /*
    / MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
