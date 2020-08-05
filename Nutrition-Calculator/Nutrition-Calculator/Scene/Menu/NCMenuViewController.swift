//
//  NCMenuViewController.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/4.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

protocol NCMenuViewControllerDelegate: class {
    func menuViewControllerDidUpdateChosenFood(_ vc: NCMenuViewController, chosenFood: [NCFood])
}

class NCMenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var menu: NCMenu?
    
    var chosenFood: [NCFood] = []
    
    weak var delegate: NCMenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension NCMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu?.menu["汉堡"]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! NCMenuCell
        if let food = menu?.menu["汉堡"]?[indexPath.row] {
            let description = food.description == "" ? "" : "⚡️" + food.description
            cell.info = (food.name, description, UIImage(named: food.name)!)
            cell.isChosen = chosenFood.contains(food)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NCMenuCell
        if let food = menu?.menu["汉堡"]?[indexPath.row] {
            
            if cell.isChosen {
                for i in 0...chosenFood.count - 1 {
                    if chosenFood[i].name == food.name { chosenFood.remove(at: i); break }
                }
            } else {
                chosenFood.append(food)
            }
            
            UIView.performWithoutAnimation {
                self.collectionView.reloadItems(at: [indexPath])
            }
            delegate?.menuViewControllerDidUpdateChosenFood(self, chosenFood: chosenFood)
        }
    }
}
