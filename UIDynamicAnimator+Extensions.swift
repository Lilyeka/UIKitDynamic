//
//  UIDynamicAnimator+Extensions.swift
//  UIKitDynamics
//
//  Created by Лилия Левина on 17/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

extension UIDynamicAnimator {
    func views(in rect: CGRect) -> [UIView] {
        let nsitems = self.items(in: rect) as NSArray
        return nsitems.compactMap({$0 as? UIView})
    }
}
