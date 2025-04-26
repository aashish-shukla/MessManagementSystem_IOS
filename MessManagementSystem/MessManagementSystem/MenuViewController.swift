import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedMenuType: String = "Breakfast" // Example: Breakfast/Lunch/Snacks/Dinner
    var selectedDay: String = "Monday" // We'll pass this from MainPage
    
    var currentMenuItems: [String] = []
    
    // Veg Menu based on Day and Meal
    let vegMenu: [String: [String: String]] = [
        "Monday": [
            "Breakfast": "Poha",
            "Lunch": "Veg Biryani",
            "Snacks": "Samosa",
            "Dinner": "Dal Tadka"
        ]
        // You can add Tuesday, Wednesday similarly
    ]
    
    // Non-Veg Menu based on Day and Meal
    let nonVegMenu: [String: [String: String]] = [
        "Monday": [
            "Breakfast": "Egg Sandwich",
            "Lunch": "Chicken Biryani",
            "Snacks": "Egg Roll",
            "Dinner": "Butter Chicken"
        ]
        // Add Tuesday, Wednesday similarly
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        updateMenu()
    }
    
    func updateMenu() {
        if let user = currentUser {
            let foodType = user["foodType"] as? String ?? "Veg"
            
            if foodType == "Veg" {
                if let dayMenu = vegMenu[selectedDay] {
                    if let item = dayMenu[selectedMenuType] {
                        currentMenuItems = [item]
                    }
                }
            } else {
                if let dayMenu = nonVegMenu[selectedDay] {
                    if let item = dayMenu[selectedMenuType] {
                        currentMenuItems = [item]
                    }
                }
            }
        }
        tableView.reloadData()
    }
    
    // MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = currentMenuItems[indexPath.row]
        return cell
    }
}

