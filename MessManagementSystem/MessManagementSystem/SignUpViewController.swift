import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var regNoField: UITextField!
    @IBOutlet weak var contactField: UITextField!
    @IBOutlet weak var foodTypeSwitch: UISwitch!
    @IBOutlet weak var foodTypeLabel: UILabel!

    var selectedFoodType = "Veg" // Default value

    override func viewDidLoad() {
        super.viewDidLoad()
        foodTypeSwitch.isOn = true
        foodTypeLabel.text = "Veg"
    }

    @IBAction func foodTypeSwitchToggled(_ sender: UISwitch) {
        if sender.isOn {
            selectedFoodType = "Veg"
            foodTypeLabel.text = "Veg"
        } else {
            selectedFoodType = "Non Veg"
            foodTypeLabel.text = "Non Veg"
        }
    }

    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let name = nameField.text ?? ""
        let password = passwordField.text ?? ""
        let regNo = regNoField.text ?? ""
        let contact = contactField.text ?? ""

        if name.isEmpty || password.isEmpty || regNo.isEmpty || contact.isEmpty {
            showAlert(message: "Please fill all fields!")
            return
        }

        let newUser = [
            "name": name,
            "password": password,
            "regNo": regNo,
            "contact": contact,
            "foodType": selectedFoodType
        ]

        usersData.append(newUser)

        let successAlert = UIAlertController(title: "Success", message: "Signup Successful!", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(successAlert, animated: true)
    }

    func showAlert(message: String) {
        let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default))
        present(errorAlert, animated: true)
    }
}
