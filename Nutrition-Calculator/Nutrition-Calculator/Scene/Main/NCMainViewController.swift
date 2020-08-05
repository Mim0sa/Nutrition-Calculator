//
//  NCMainViewController.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/1.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class NCMainViewController: UIViewController {
    
    var menu: NCMenu!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fetchMenuFromPlist()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for food in menu.menu["汉堡"]! {
            print(food.name)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "MenuVC" {
            guard let menuVC = segue.destination as? NCMenuViewController else { fatalError() }
            menuVC.menu = menu
            print("1")
        }
    }
    
}

// Static Model
extension NCMainViewController {
    func fetchMenuFromPlist() {
        if let path = Bundle.main.path(forResource: "Menu", ofType:"plist"), let rawMenu = NSArray(contentsOfFile: path) {
            var foods: Set<NCFood> = []
            for rawFood in rawMenu {
                if let rawFood = rawFood as? [String:Any], let rawNutritions = rawFood["nutritions"] as? [String:Any] {
                    let nutritions = NCNutrition(calories:     rawNutritions["calories"]     as! Int,
                                                 protein:      rawNutritions["protein"]      as! Double,
                                                 fat:          rawNutritions["fat"]          as! Double,
                                                 carbohydrate: rawNutritions["carbohydrate"] as! Double,
                                                 sodium:       rawNutritions["sodium"]       as! Double,
                                                 calcium:      rawNutritions["calcium"]      as! Double)
                    let food = NCFood(categoryType:  rawFood["categoryType"]  as! String,
                                      categoryIndex: rawFood["categoryIndex"] as! Int,
                                      name:          rawFood["name"]          as! String,
                                      description:   rawFood["description"]   as! String,
                                      nutritions:    nutritions)
                    foods.insert(food)
                }
            }
            menu = NCMenu(with: foods)
        }
    }
}

