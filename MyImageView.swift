//
//  MyImageView.swift
//  UIKitDynamics
//
//  Created by Лилия Левина on 17/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class MyImageView: UIImageView {
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .ellipse
    }

}
