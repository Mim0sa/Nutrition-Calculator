//
//  NCModel.swift
//  MDNC
//
//  Created by Mimosa on 2020/9/18.
//

import Foundation

class NCModel {
    
    let menu: NCMenu
    
    var myMenu: [NCFood] = []
    var currentCategory: String = NCMenu.categoryOrder.first!
    
    init() { menu = NCModel.fetchMenuFromPlist() }
    
    func add(food: NCFood) {
        myMenu.append(food)
    }
    
    func remove(food: NCFood) {
        if (myMenu.firstIndex(of: food) != nil) {
            myMenu.remove(at: myMenu.firstIndex(of: food)!)
        }
    }
    
    func removeAll() {
        myMenu.removeAll()
    }
    
    func getCurrentSumNutritions() -> NCNutrition {
        return NCModel.getSumNutritions(with: myMenu)
    }
    
    static func getSumNutritions(with chosenFood: [NCFood]) -> NCNutrition {
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
    
    static func fetchMenuFromPlist() -> NCMenu {
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
            return NCMenu(with: foods)
        } else {
            fatalError("No Menu Plist File")
        }
    }
}

struct NCMenu {
    
    var menu: [String:[NCFood]] = [:]
    
    var categoryList: [String] {
        get {
            var list: [String] = []
            for category in menu {
                list.append(category.key)
            }
            return list.sorted { (c1, c2) -> Bool in
                return NCMenu.categoryOrder.firstIndex(of: c1) ?? 0
                    < NCMenu.categoryOrder.firstIndex(of: c2) ?? 0
            }
        }
    }
    
    init(with foods: Set<NCFood>) {
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
    
    static let categoryOrder: [String] = ["汉堡", "小食", "甜品", "饮料", "早餐", "开心乐园餐",
                                                  "McCafé 咖啡", "McCafé 茶饮", "McCafé 雪冰", "McCafé 糕点"]
}

struct NCFood: Hashable {
    var categoryType: String
    var categoryIndex: Int

    var name: String
    var description: String
    
    var nutritions: NCNutrition
}

struct NCNutrition: Hashable {
    var calories: Int
    var protein: Double
    var fat: Double
    var carbohydrate: Double
    var sodium: Double
    var calcium: Double
    
    var calories_joule: Int { get { return Int(Float(calories) * 4.184) } }
}
