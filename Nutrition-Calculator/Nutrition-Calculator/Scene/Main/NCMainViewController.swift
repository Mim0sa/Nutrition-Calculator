//
//  NCMainViewController.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/1.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class NCMainViewController: UIViewController {
    
    @IBOutlet var nutritionLabels: [UILabel]!
    
    var menu: NCMenu!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fetchMenuFromPlist()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "MenuVC" {
            guard let menuVC = segue.destination as? NCMenuViewController else { fatalError() }
            menuVC.delegate = self
            menuVC.menu = menu
        }
    }
}

extension NCMainViewController: NCMenuViewControllerDelegate {
    func menuViewControllerDidUpdateChosenFood(_ vc: NCMenuViewController, chosenFood: [NCFood]) {
        let nutritions = menu.getSumNutritions(with: chosenFood)
        nutritionLabels[0].text = "\(nutritions.calories)/\(nutritions.calories_joule)"
        nutritionLabels[1].text = String(format: "%.1f", nutritions.protein)
        nutritionLabels[2].text = String(format: "%.1f", nutritions.fat)
        nutritionLabels[3].text = String(format: "%.1f", nutritions.carbohydrate)
        nutritionLabels[4].text = String(format: "%.0f", nutritions.sodium)
        nutritionLabels[5].text = String(format: "%.0f", nutritions.calcium)
    }
}

// Helpers & Static Model
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

