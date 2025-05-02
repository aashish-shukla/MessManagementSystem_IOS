//
//  ViewController.swift
//  SarvahaarMess
//
//  Created by Aashish Shukla on 01/05/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.isEnabled = false

                nameTextField.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
                passwordTextField.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    @objc func textFieldsChanged() {
            let isFilled = !(nameTextField.text?.isEmpty ?? true) &&
                           !(passwordTextField.text?.isEmpty ?? true)
            signInButton.isEnabled = isFilled
        }
    @IBAction func signInTapped(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        let storedName = UserDefaults.standard.string(forKey: "userName")
        let storedPassword = UserDefaults.standard.string(forKey: "userPassword")

        if name == storedName && password == storedPassword
        {
            if let mainVC = storyboard?.instantiateViewController(withIdentifier: "Main") as? MainViewController {
                mainVC.userName = name // ✅ Pass name
                        mainVC.modalPresentationStyle = .fullScreen
                        present(mainVC, animated: true)
                    }
                } else {
                    let alert = UIAlertController(title: "Login Failed", message: "Invalid credentials", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    present(alert, animated: true)
                }
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        if let signUpVC = storyboard?.instantiateViewController(withIdentifier: "signUp") as? signupViewController {
            signUpVC.modalPresentationStyle = .fullScreen
            present(signUpVC, animated: true)
        }
    }
    

}

