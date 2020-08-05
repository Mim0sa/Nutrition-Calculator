//
//  Nutrition.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/4.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import Foundation

struct NCNutrition: Hashable {
    
    var calories: Int
    var protein: Double
    var fat: Double
    var carbohydrate: Double
    var sodium: Double
    var calcium: Double
    
    var calories_joule: Int {
        get { return Int(Float(calories) * 4.184) }
    }
}
