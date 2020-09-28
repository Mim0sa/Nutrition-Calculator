//
//  NCCategoryVC.swift
//  MDNC
//
//  Created by Mimosa on 2020/9/18.
//

import UIKit

class NCCategoryVC: UIViewController {
    
    var model: NCModel?

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension NCCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.menu.categoryList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NCCategoryCell", for: indexPath) as! NCCategoryCell
        guard let categoryList = model?.menu.categoryList else { fatalError("Model should not be nil") }
        cell.imageView.image = UIImage(named: NCCategoryVC.categoryImageName[categoryList[indexPath.row]] ?? "")
        cell.titleLabel.text = categoryList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        model?.currentCategory = model?.menu.categoryList[indexPath.row] ?? ""
    }
    
    static let categoryImageName: [String:String] = ["汉堡":"巨无霸", "小食":"薯条", "甜品":"圆筒冰淇淋", "饮料":"可口可乐", "早餐":"猪柳蛋麦满分", "开心乐园餐":"开心乐园餐",
                                                     "McCafé 咖啡":"卡布奇诺", "McCafé 茶饮":"抹茶拿铁", "McCafé 雪冰":"摩卡雪冰", "McCafé 糕点":"经典芝士蛋糕"]
}

class NCCategoryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
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
