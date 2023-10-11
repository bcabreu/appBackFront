//
//  UIView + Extension.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 11/10/23.
//

import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat, typeCorners: CACornerMask) {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = typeCorners
    }
}
