//
//  ViewController.swift
//  MessManagementSystem
//
//  Created by Student on 10/04/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var regNoText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        let name = nameText.text
        let regNo = regNoText.text
        let password = passwordText.text
        
        if name != nil && regNo != nil && password != nil && name != "" && regNo != "" && password != "" {
            var isValidUser = false
            for user in allUsers{
                let uName = user["name"] as? String
                let uReg = user["regNo"] as? String
                let uPass = user["password"] as? String
                
                if uName == name && uReg == regNo && uPass == password {
                    isValidUser = true
                    break
                }
            }
            if isValidUser {
                shouldPerformSegue(withIdentifier: "MainPage", sender: self)
            }
            else {
                showAlert(title: "Missing Fields", message: "Please fill in all fields.")
            }
        }
        else {
            showAlert(title: "Missing Fields", message: "Please fill in all fields.")
        }
        
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay",style: .default))
        present(alert,animated: true)
    }
    @IBAction func signUpTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUp", sender: self)
    }
    
}

