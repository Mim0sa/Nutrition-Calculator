//
//  NCListViewController.swift
//  Nutrition-Calculator
//
//  Created by CM on 2020/8/24.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class NCListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: true, completion: nil)
        }
    }

}

class CustomFramePresentationController: UIPresentationController {
    
    var customFrame: CGRect
    
    init(presented: UIViewController, presenting: UIViewController?, frame: CGRect) {
        customFrame = frame
        
        super.init(presentedViewController: presented, presenting: presenting)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        return customFrame
    }
}
