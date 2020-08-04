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
    
    init(with foods: Set<NCFood>) {
        menu = [:]
        
        for food in foods {
            if let list = menu[food.categoryType] {
                for i in 0...list.count - 1 {
                    if food.categoryIndex < list[i].categoryIndex {
                        menu[food.categoryType]!.insert(food, at: i)
                        break
                    }
                }
                menu[food.categoryType]!.append(food)
            } else {
                menu[food.categoryType] = []
                menu[food.categoryType]!.append(food)
            }
        }
    }
}
