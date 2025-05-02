//
//  SharedMenuData.swift
//  SarvahaarMess
//
//  Created by Aashish Shukla on 01/05/25.
//

import Foundation

class SharedMenuData {
    static let shared = SharedMenuData()

    // Structure: [Day: [Meal: (VegDish, NonVegDish, VegImageName, NonVegImageName)]]
    var weeklyMenu: [String: [String: (String, String, String, String)]] = [
        "Monday": [
            "Breakfast": ("Poha & Chutney", "Omelette & Bread", "poha", "omelette"),
            "Lunch": ("Paneer Butter Masala with Rice", "Chicken Curry with Rice", "paneerButterMasala", "chickenCurry"),
            "Snacks": ("Samosa & Tea", "Egg Puff", "samosa", "eggPuff"),
            "Dinner": ("Veg Biryani", "Mutton Biryani", "vegBiryani", "muttonBiryani")
        ],
        "Tuesday": [
            "Breakfast": ("Idli & Sambhar", "Egg Sandwich", "idli", "eggSandwich"),
            "Lunch": ("Rajma & Rice", "Fish Curry & Rice", "rajma", "fishCurry"),
            "Snacks": ("Kachori & Jalebi", "Chicken Roll", "kachori", "chickenRoll"),
            "Dinner": ("Roti & Mix Veg", "Egg Curry & Roti", "roti", "eggCurry")
        ],
        "Wednesday": [
            "Breakfast": ("Upma", "Boiled Eggs & Toast", "upma", "boiledEggs"),
            "Lunch": ("Aloo Gobi with Chapati", "Butter Chicken & Naan", "alooGobi", "butterChicken"),
            "Snacks": ("Bread Pakora", "Chicken Nuggets", "breadPakora", "chickenNuggets"),
            "Dinner": ("Veg Pulao & Raita", "Fish Fry & Rice", "vegPulao", "fishFry")
        ],
        "Thursday": [
            "Breakfast": ("Vegetable Sandwich", "Egg Bhurji", "sandwich", "eggBhurji"),
            "Lunch": ("Chole & Rice", "Mutton Curry & Rice", "chole", "muttonCurry"),
            "Snacks": ("Paneer Puff", "Meat Puff", "paneerPuff", "meatPuff"),
            "Dinner": ("Daal & Roti", "Chicken Biryani", "daal", "chickenBiryani")
        ],
        "Friday": [
            "Breakfast": ("Sabudana Khichdi", "Masala Omelette", "sabudana", "masalaOmelette"),
            "Lunch": ("Mixed Veg Curry & Rice", "Prawn Curry & Rice", "mixedVegCurry", "prawnCurry"),
            "Snacks": ("Veg Cutlet", "Fish Fingers", "vegCutlet", "fishFingers"),
            "Dinner": ("Khichdi & Curd", "Egg Masala & Chapati", "khichdi", "eggMasala")
        ],
        "Saturday": [
            "Breakfast": ("Paratha & Curd", "Boiled Egg & Toast", "paratha", "boiledEgg"),
            "Lunch": ("Bhindi Masala & Rice", "Kadai Chicken & Rice", "bhindiMasala", "kadaiChicken"),
            "Snacks": ("Aloo Tikki", "Chicken Popcorn", "alooTikki", "chickenPopcorn"),
            "Dinner": ("Vegetable Pulao", "Mutton Korma & Rice", "vegetablePulao", "muttonKorma")
        ],
        "Sunday": [
            "Breakfast": ("Dosa & Chutney", "Bacon & Eggs", "dosa", "baconAndEggs"),
            "Lunch": ("Malai Kofta & Rice", "Chicken Roast & Rice", "malaiKofta", "chickenRoast"),
            "Snacks": ("French Fries", "Hot Dog", "fries", "hotDog"),
            "Dinner": ("Stuffed Paratha", "Butter Chicken & Naan", "stuffedParatha", "butterChicken")
        ]
    ]

    private init() {}
}
