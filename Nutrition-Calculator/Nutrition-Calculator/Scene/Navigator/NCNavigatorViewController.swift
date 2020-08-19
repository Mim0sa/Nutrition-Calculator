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
        cell.image.image = UIImage(named: NCNavigatorViewController.categoryImageName[menu?.categoryList[indexPath.row] ?? ""] ?? "")
        cell.title.text = menu?.categoryList[indexPath.row]
        if cell.title.text == currentCategory { cell.isChosen = true } else { cell.isChosen = false }
        //cell.backgroundColor = .randomColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigatorViewControllerDidUpdateChosenCategory(self, categoryName: (menu?.categoryList[indexPath.row])!)
    }
    
    static let categoryImageName: [String:String] = ["汉堡":"巨无霸", "小食":"薯条", "甜品":"圆筒冰淇淋", "饮料":"可口可乐"]
}
