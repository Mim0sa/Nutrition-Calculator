//
//  NCMenuCell.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/4.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class NCMenuCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var isChosen: Bool = false {
        willSet {
            updateBorder(with: newValue)
        }
    }
    
    func updateBorder(with isChosen: Bool) {
        if isChosen {
            layer.borderWidth = 1
            layer.borderColor = UIColor.orange.cgColor
        } else {
            layer.borderWidth = 0
            layer.borderColor = UIColor.orange.cgColor
        }
        
    }
    
}
