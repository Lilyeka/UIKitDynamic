//
//  ViewController.swift
//  UIKitDynamics
//
//  Created by Лилия Левина on 17/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var anim: UIDynamicAnimator?
    var iv : MyImageView = {
        var iv = MyImageView(image: UIImage(named: "boat")!)
        iv.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(iv)
        anim = UIDynamicAnimator(referenceView: self.view)
        anim?.addBehavior(MyBounceAndRollBehavior(view:self.iv))
    }
}





