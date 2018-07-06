//
//  Extensions.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol Rotatable {
    func rotate(at angle: CGFloat, duration: TimeInterval)
}

extension Rotatable where Self: UIView {
    
    func rotate(at angle: CGFloat, duration: TimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = angle
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        self.layer.add(animation, forKey: nil)
    }

}

extension UIView: Rotatable { }
