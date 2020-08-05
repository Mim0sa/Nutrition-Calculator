//
//  NCMenuViewController.swift
//  Nutrition-Calculator
//
//  Created by 吉乞悠 on 2020/8/4.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class NCMenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var menu: NCMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension NCMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NCMenuCell
        cell.isChosen.toggle()
    }
}
