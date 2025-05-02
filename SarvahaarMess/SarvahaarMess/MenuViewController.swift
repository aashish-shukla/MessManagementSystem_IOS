//
//  MenuViewController.swift
//  SarvahaarMess
//
//  Created by Aashish Shukla on 01/05/25.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var vegSwitch: UISwitch!
    @IBOutlet weak var vegNonVegLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var feedbackButton: UIButton!

    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let meals = ["Breakfast", "Lunch", "Snacks", "Dinner"]

        // Default is Veg
    var isVegSelected = true

    override func viewDidLoad() {
            super.viewDidLoad()
            title = "Weekly Menu"
            tableView.dataSource = self
            tableView.delegate = self

            // Set default label and color
            vegNonVegLabel.text = "VEG"
            vegNonVegLabel.textColor = UIColor.systemGreen
            vegSwitch.isOn = true
        }

        // MARK: - TableView Data Source

        func numberOfSections(in tableView: UITableView) -> Int {
            return daysOfWeek.count
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return meals.count
        }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return daysOfWeek[section]
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

            let day = daysOfWeek[indexPath.section]
            let meal = meals[indexPath.row]

            if let mealData = SharedMenuData.shared.weeklyMenu[day]?[meal] {
                cell.textLabel?.text = meal
                let selectedMenu = isVegSelected ? "Veg: \(mealData.0)" : "NonVeg: \(mealData.1)"
                cell.detailTextLabel?.text = selectedMenu
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
                cell.detailTextLabel?.numberOfLines = 2
            } else {
                cell.textLabel?.text = meal
                cell.detailTextLabel?.text = "No menu available"
            }

            return cell
        }

        // MARK: - Veg/Non-Veg Switch Action

        @IBAction func vegSwitchToggled(_ sender: UISwitch) {
            isVegSelected = sender.isOn
            vegNonVegLabel.text = isVegSelected ? "VEG" : "NONVEG"
            vegNonVegLabel.textColor = isVegSelected ? UIColor.systemGreen : UIColor.systemRed
            tableView.reloadData()
        }

        // MARK: - Feedback Button Action

        @IBAction func feedbackButtonTapped(_ sender: UIButton) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let feedbackVC = storyboard.instantiateViewController(withIdentifier: "Feedback") as? FeedbackViewController {
                navigationController?.pushViewController(feedbackVC, animated: true)
                present(feedbackVC,animated: true)
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
