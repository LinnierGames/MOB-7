//
//  UIBootton.swift
//  03-CALayer
//
//  Created by Erick Sanchez on 5/3/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class UIBootton: UIButton {
    
    @IBInspectable
    var bgColor: UIColor {
        set {
            layer.backgroundColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: layer.backgroundColor!)
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
