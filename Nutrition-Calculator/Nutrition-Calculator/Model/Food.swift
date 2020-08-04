//
//  Food.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/4.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import Foundation

protocol NCCategorizable {
    var categoryType: String { get set}
    var categoryIndex: Int { get set }
}

struct NCFood: NCCategorizable, Hashable {
    
    var categoryType: String
    var categoryIndex: Int

    var name: String
    var description: String?
    
    var nutritions: NCNutrition

}
