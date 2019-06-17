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
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines  = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Кличка"
        return label
    }()
    
    var nameLabelHorisontalConstraint: NSLayoutConstraint?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(iv)
        anim = UIDynamicAnimator(referenceView: self.view)
        anim?.addBehavior(MyBounceAndRollBehavior(view:self.iv))
        anim?.perform (Selector (("setDebugEnabled:")), with: true) // turn on a display that reveals visually what the animator is doing, showing its attachment lines and so forth;
        configureLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //here we animate changing in constraints
        nameLabelHorisontalConstraint!.constant += 100
        UIView.animate(withDuration:1) {
           self.nameLabel.superview!.layoutIfNeeded()
        }
    }
    
    func configureLabel() {
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        nameLabelHorisontalConstraint = nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        nameLabelHorisontalConstraint!.isActive = true
    }
}





