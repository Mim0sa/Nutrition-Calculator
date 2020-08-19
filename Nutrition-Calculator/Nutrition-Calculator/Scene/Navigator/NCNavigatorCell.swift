//
//  NCNavigatorCell.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/6.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class NCNavigatorCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var gradientView: UIView! {
        didSet {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor(withHex: 0xFABC0F).cgColor, UIColor(withHex: 0xffffff).cgColor]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
            gradientLayer.cornerRadius = 24
            
            gradientView.layer.addSublayer(gradientLayer)
        }
    }
    
    var isChosen = false {
        didSet {
            gradientView.isHidden = !isChosen
        }
    }
    
}
