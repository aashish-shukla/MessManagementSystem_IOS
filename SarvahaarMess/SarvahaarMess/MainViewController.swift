import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var vegSwitch: UISwitch!
    @IBOutlet weak var vegLabel: UILabel!
    @IBOutlet weak var mealSegmentControl: UISegmentedControl!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!

    // MARK: - Data
    let foodData: [String: (String, String, String, String)] = [
        "Breakfast": ("Idli with Chutney", "idli", "Egg Sandwich", "eggSandwich"),
        "Lunch": ("Paneer Curry & Rice", "paneer curry", "Chicken Curry & Rice", "chickenCurry"),
        "Snacks": ("Samosa & Tea", "Samosa", "Chicken Roll", "ChickenRoll"),
        "Dinner": ("Roti & Veg Sabzi", "roti sabji", "Egg Curry & Roti", "eggcurry")
    ]

    var isVeg = true
    var userName: String = "Guest" // You can update this from your login/signup flow

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
    }

    // MARK: - Setup
    func setupInitialUI() {
        welcomeLabel.text = "Welcome \(userName)"
        setCurrentDay()
        vegSwitch.isOn = true
        vegLabel.text = "Veg"
        mealSegmentControl.selectedSegmentIndex = 0
        updateFoodDisplay(for: "Breakfast")
    }

    func setCurrentDay() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        dayLabel.text = " \(formatter.string(from: Date()))"
    }

    // MARK: - Food Display Logic
    func updateFoodDisplay(for meal: String) {
        if let data = foodData[meal] {
            if isVeg {
                foodLabel.text = data.0
                foodImageView.image = UIImage(named: data.1)
            } else {
                foodLabel.text = data.2
                foodImageView.image = UIImage(named: data.3)
            }
        } else {
            foodLabel.text = "No food available"
            foodImageView.image = nil
        }
    }

    // MARK: - Actions
    @IBAction func switchToggled(_ sender: UISwitch) {
        isVeg = sender.isOn
        vegLabel.text = isVeg ? "Veg" : "Non-Veg"
        
        let index = mealSegmentControl.selectedSegmentIndex
        if index >= 0 {
            let selectedMeal = mealSegmentControl.titleForSegment(at: index) ?? "Breakfast"
            updateFoodDisplay(for: selectedMeal)
        }
    }

    @IBAction func mealChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        if index >= 0 {
            let selectedMeal = sender.titleForSegment(at: index) ?? "Breakfast"
            updateFoodDisplay(for: selectedMeal)
        }
    }

    @IBAction func openMenuTapped(_ sender: UIButton) {
        view.endEditing(true)
                UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
                
                // Prevent double-tapping
                sender.isEnabled = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    sender.isEnabled = true
                }
                
                // Perform Segue to MenuViewController
                performSegue(withIdentifier: "showMenu", sender: self)
        }
        
        // Push MenuViewController on the main thread
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showMenu" {
                if let menuVC = segue.destination as? MenuViewController {
                    // You can pass data to MenuViewController if necessary
                    // For example: menuVC.someData = someValue
                }
            }
        }
}
