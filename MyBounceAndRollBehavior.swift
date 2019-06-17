//
//  MyBounceAndRollBehavior.swift
//  UIKitDynamics
//
//  Created by Лилия Левина on 17/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class MyBounceAndRollBehavior: UIDynamicBehavior {
    let v : UIView
    
    init(view v: UIView) {
        self.v = v
        super.init()
    }
    
    override func willMove(to dynamicAnimator: UIDynamicAnimator?) {
        guard let anim = dynamicAnimator else { return }
        let sup = self.v.superview!
        let b = sup.bounds
        
        let grav = UIGravityBehavior()
        grav.action = { [unowned self] in
            let items = anim.views(in: b)
            if items.firstIndex(of: self.v) == nil {
                anim.removeBehavior(self)
                self.v.removeFromSuperview()
            }
        }
        grav.addItem(self.v)
        self.addChildBehavior(grav)
        
        let coll = UICollisionBehavior()
        coll.collisionMode = .boundaries
        coll.collisionDelegate = self
        coll.addBoundary(withIdentifier: "floor" as NSString, from: CGPoint(x: b.minX, y: b.maxY), to: CGPoint(x: b.maxX, y: b.maxY))
        coll.addItem(self.v)
        self.addChildBehavior(coll)
        
        
        let bounce = UIDynamicItemBehavior()
        bounce.elasticity = 0.8
        bounce.friction = 0.3
        bounce.addItem(self.v)
        self.addChildBehavior(bounce)
    }
}

extension MyBounceAndRollBehavior: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let b = self.childBehaviors
        if let bounce = (b.compactMap{$0 as? UIDynamicItemBehavior}).first {
            let v = bounce.angularVelocity(for: item)
            if v <= 6 {
                bounce.addAngularVelocity(6, for: item)
            }
        }
    }
}
