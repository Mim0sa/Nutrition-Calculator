//
//  NCCategoryVC.swift
//  MDNC
//
//  Created by Mimosa on 2020/9/18.
//

import UIKit

class NCCategoryVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension NCCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NCCategoryCell", for: indexPath)
        return cell
    }
}

class NCCategoryFlowLayout: UICollectionViewFlowLayout {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        scrollDirection = .horizontal
        minimumLineSpacing = 6
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        itemSize = CGSize(width: 86, height: 100)
    }
}
