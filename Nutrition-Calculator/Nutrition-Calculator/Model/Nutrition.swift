//
//  Nutrition.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/4.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import Foundation

struct NCNutrition: Hashable {
    
    let calories: Int
    let protein: Double
    let fat: Double
    let carbohydrate: Double
    let sodium: Double
    let calcium: Double
    
    var calories_joule: Int {
        get { return Int(Float(calories) * 4.184) }
    }
}
