import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWelcome()
        setupDay()
        updateFoodMenu()
    }

    func setupWelcome() {
        if let user = currentUser {
            if let name = user["name"] as? String {
                welcomeLabel.text = "Welcome \(name)"
            } else {
                welcomeLabel.text = "Welcome Guest"
            }
        } else {
            welcomeLabel.text = "Welcome Guest"
        }
    }

    func setupDay() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let today = formatter.string(from: Date())
        dayLabel.text = today
    }

    func updateFoodMenu() {
        if let user = currentUser {

            let vegMenus = [
                "Breakfast": "Veg Sandwich",
                "Lunch": "Paneer Rice",
                "Snacks": "Veg Puff",
                "Dinner": "Dal Roti"
            ]

            let nonVegMenus = [
                "Breakfast": "Egg Sandwich",
                "Lunch": "Chicken Biryani",
                "Snacks": "Chicken Roll",
                "Dinner": "Butter Chicken"
            ]

            let selectedIndex = segmentControl.selectedSegmentIndex
            let selectedMeal = segmentControl.titleForSegment(at: selectedIndex) ?? "Breakfast"

            if let foodType = user["foodType"] as? String {
                if foodType == "Veg" {
                    foodNameLabel.text = vegMenus[selectedMeal]
                    if let imageName = vegMenus[selectedMeal] {
                        foodImageView.image = UIImage(named: imageName)
                    }
                } else {
                    foodNameLabel.text = nonVegMenus[selectedMeal]
                    if let imageName = nonVegMenus[selectedMeal] {
                        foodImageView.image = UIImage(named: imageName)
                    }
                }
            }
        }
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        updateFoodMenu()
    }
}
