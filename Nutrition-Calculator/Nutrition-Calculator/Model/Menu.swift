//
//  Menu.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/4.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import Foundation

struct NCMenu {
    
    var menu: [String:[NCFood]]
    
    var categoryList: [String] {
        get {
            var list: [String] = []
            for category in menu {
                list.append(category.key)
            }
            return list
        }
    }
    
    init(with foods: Set<NCFood>) {
        menu = [:]
        
        for food in foods {
            if let list = menu[food.categoryType] {
                for i in 0...list.count - 1 {
                    if food.categoryIndex < list[i].categoryIndex {
                        menu[food.categoryType]!.insert(food, at: i)
                        break
                    }
                    if i == list.count - 1 {
                        menu[food.categoryType]!.append(food)
                    }
                } 
            } else {
                menu[food.categoryType] = []
                menu[food.categoryType]!.append(food)
            }
        }
    }
    
    func getSumNutritions(with chosenFood: [NCFood]) -> NCNutrition {
        var nutritions = NCNutrition(calories: 0, protein: 0, fat: 0, carbohydrate: 0, sodium: 0, calcium: 0)
        for food in chosenFood {
            nutritions.calories += food.nutritions.calories
            nutritions.protein += food.nutritions.protein
            nutritions.fat += food.nutritions.fat
            nutritions.carbohydrate += food.nutritions.carbohydrate
            nutritions.sodium += food.nutritions.sodium
            nutritions.calcium += food.nutritions.calcium
        }
        return nutritions
    }
}
