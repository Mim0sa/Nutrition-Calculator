//
//  NCMenuVC.swift
//  MDNC
//
//  Created by Mimosa on 2020/9/25.
//

import UIKit

class NCMenuVC: UIViewController {
    
    var model: NCModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension NCMenuVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfItems = model?.menu.menu[model?.currentCategory ?? ""]?.count else { return 0 }
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NCMenuCell", for: indexPath) as! NCMenuCell
        guard let food = model?.menu.menu[model?.currentCategory ?? ""]?[indexPath.row] else { fatalError("Model should not be nil") }
        cell.imageView.image = UIImage(named: food.name)
        cell.titleLabel.text = food.name
        cell.descriptionLabel.text = food.description == "" ? " " : "⚡️" + food.description
        return cell
    }
}

class NCMenuCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

class NCMenuFlowLayout: UICollectionViewFlowLayout {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        scrollDirection = .vertical
        minimumLineSpacing = 8
        minimumInteritemSpacing = 8
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)

        itemSize = CGSize(width: (screenWidth - 40 - 16 - 1) / 3,
                          height: (screenWidth - 40 - 16 - 1) / 3 * 1.5)
    }
}

private var screenWidth: CGFloat { get { return UIScreen.main.bounds.width } }
private var screenHeight: CGFloat { get { return UIScreen.main.bounds.height } }
