import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var regNoField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signinButtonTapped(_ sender: UIButton) {
        let name = nameField.text ?? ""
        let regNo = regNoField.text ?? ""
        let password = passwordField.text ?? ""

        if name.isEmpty || regNo.isEmpty || password.isEmpty {
            showAlert(message: "Please fill all fields!")
            return
        }

        var isValidUser = false
        var userDict: [String: String]?

        for user in usersData {
            if user["name"] == name && user["regNo"] == regNo && user["password"] == password {
                isValidUser = true
                userDict = user
                break
            }
        }

        if isValidUser {
            let mainPageVC = storyboard?.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
            currentUser = userDict
            navigationController?.pushViewController(mainPageVC, animated: true)
        } else {
            showAlert(message: "Invalid Credentials!")
        }
    }

    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let signupVC = storyboard?.instantiateViewController(withIdentifier: "signUp") as! SignUpViewController
        navigationController?.pushViewController(signupVC, animated: true)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}


