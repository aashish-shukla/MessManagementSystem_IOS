//
//  signUpViewController.swift
//  MessManagementSystem
//
//  Created by Student on 21/04/25.
//

import UIKit

class signUpViewController: UIViewController {
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var pwdtxt: UITextField!
    @IBOutlet weak var contactTxt: UITextField!
    @IBOutlet weak var foodType: UISwitch!
    @IBOutlet weak var regTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodType.isOn = true

        // Do any additional setup after loading the view.
    }
    @IBAction func signUpTapped(_ sender: UIButton) {
        let name = nameTxt.text
                let regNo = regTxt.text
                let password = pwdtxt.text
                let contact = contactTxt.text
                let isVeg = foodType.isOn

                if name != nil && regNo != nil && password != nil && contact != nil &&
                    name != "" && regNo != "" && password != "" && contact != "" {

                    let user: [String: Any] = [
                        "name": name!,
                        "regNo": regNo!,
                        "password": password!,
                        "isVeg": isVeg,
                        "contact": contact!
                    ]

                    allUsers.append(user)
                    performSegue(withIdentifier: "mainPage", sender: user)

                } else {
                    showAlert(title: "Missing Fields", message: "Please fill in all fields.")
                }
        func showAlert(title: String, message: String) {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default))
                present(alert, animated: true)
            }
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "mainPage",
                   let destination = segue.destination as? MainPage,
                   let user = sender as? [String: Any] {
                    destination.loggedInUser = user
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
