//
//  NCNavigatorViewController.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/5.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

protocol NCNavigatorViewControllerDelegate: class {
    func navigatorViewControllerDidUpdateChosenCategory(_ vc: NCNavigatorViewController, categoryName: String)
}

class NCNavigatorViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: NCNavigatorViewControllerDelegate?
    
    var menu: NCMenu?
    
    var currentCategory: String = "汉堡" {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension NCNavigatorViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu?.menu.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NavigatorCell", for: indexPath) as! NCNavigatorCell
        cell.image.image = #imageLiteral(resourceName: "不素之霸双层牛堡.png")
        cell.title.text = menu?.categoryList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigatorViewControllerDidUpdateChosenCategory(self, categoryName: (menu?.categoryList[indexPath.row])!)
    }
    
    
}
