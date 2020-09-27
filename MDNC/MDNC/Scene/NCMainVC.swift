//
//  NCMainVC.swift
//  MDNC
//
//  Created by Mimosa on 2020/9/17.
//

import UIKit

class NCMainVC: UIViewController {
    
    let model = NCModel()
    
    var categoryVC: NCCategoryVC!
    var menuVC: NCMenuVC!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        if identifier == "NCCategoryVC" { guard
            let categoryVC = segue.destination as? NCCategoryVC else { fatalError() }
            self.categoryVC = categoryVC
            categoryVC.model = model
        } else if identifier == "NCMenuVC" { guard
            let menuVC = segue.destination as? NCMenuVC else { fatalError() }
            self.menuVC = menuVC
            menuVC.model = model
        }
    }
    
}
