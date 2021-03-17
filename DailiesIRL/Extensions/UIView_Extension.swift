//
//  UIView_Extension.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 3/17/21.
//

import UIKit

extension UIView {
    func addDropShadow(opacity: Float, offset: CGSize, radius: CGFloat, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
