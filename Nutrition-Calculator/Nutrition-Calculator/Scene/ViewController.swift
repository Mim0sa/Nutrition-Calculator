//
//  ViewController.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/1.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menu: NCMenu!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMenuFromPlist()
        
        for food in menu.menu["汉堡"]! {
            print(food.name)
        }
    }
    
}

extension ViewController {
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
                                      description:   rawFood["description"]   as? String,
                                      nutritions:    nutritions)
                    foods.insert(food)
                }
            }
            menu = NCMenu(with: foods)
        }
    }
}

