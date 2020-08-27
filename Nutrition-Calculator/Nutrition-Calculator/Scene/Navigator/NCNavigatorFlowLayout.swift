//
//  NCNavigatorFlowLayout.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/5.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class NCNavigatorFlowLayout: UICollectionViewFlowLayout {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        scrollDirection = .horizontal
        minimumLineSpacing = 8
        minimumInteritemSpacing = 20
        sectionInset = UIEdgeInsets(top: 5, left: 25, bottom: 0, right: 25)

        itemSize = CGSize(width: 66, height: 66)
    }
}
