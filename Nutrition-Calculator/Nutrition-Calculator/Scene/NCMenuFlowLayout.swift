//
//  NCMenuFlowLayout.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/5/24.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class NCMenuFlowLayout: UICollectionViewFlowLayout {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        scrollDirection = .vertical
        minimumLineSpacing = 20
        minimumInteritemSpacing = 20

        itemSize = CGSize(width: (screenWidth - 4 * 20) / 3, height: (screenWidth - 4 * 20) / 3 * 2)
    }
}

var screenWidth: CGFloat { get { return UIScreen.main.bounds.width } }
var screenHeight: CGFloat { get { return UIScreen.main.bounds.height } }
