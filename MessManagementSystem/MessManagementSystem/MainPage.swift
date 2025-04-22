//
//  MainPage.swift
//  MessManagementSystem
//
//  Created by Student on 21/04/25.
//

import UIKit

class MainPage: UIViewController {

    var loggedInUser: [String: Any]?

        override func viewDidLoad() {
            super.viewDidLoad()

            if let user = loggedInUser {
                let isVeg = user["isVeg"] as? Bool ?? true
                let name = user["name"] as? String ?? "User"

                if isVeg {
                    print("Welcome \(name)! Showing Veg Menu")
                    // showVegMenu()
                } else {
                    print("Welcome \(name)! Showing Non-Veg Menu")
                    // showNonVegMenu()
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
