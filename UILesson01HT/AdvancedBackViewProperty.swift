//
//  AdvancedBackViewProperty.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 21.04.2021.
//

import UIKit

@IBDesignable class AdvancedBackViewProperty: UIView {}

extension UIView {
    
    @IBInspectable var setShadowRadius: CGFloat {
        set {layer.shadowRadius = newValue}
        get {return layer.shadowRadius}
    }
    
    @IBInspectable var setShadowColor: CGColor? {
        set {layer.shadowColor = newValue}
        get {return layer.shadowColor}
    }
    
    @IBInspectable var setShadowOpacity: Float {
        set {layer.shadowOpacity = newValue}
        get {return layer.shadowOpacity}
    }
    
    //@IBInspectable var setShadow

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
