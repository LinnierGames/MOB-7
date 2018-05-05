//
//  CustomView.swift
//  03-CALayer
//
//  Created by Erick Sanchez on 5/3/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        drawMyself()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        drawMyself()
    }
    
    func drawMyself() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.frame = bounds
        layer.addSublayer(gradient)
        
        let mountainPath = UIBezierPath()
        mountainPath.move(to: CGPoint(x: 0, y: bounds.midY))
        mountainPath.addCurve(
            to: CGPoint(x: bounds.midX, y: bounds.midY + bounds.height / 4.0),
            controlPoint1: CGPoint(x: bounds.width / 4.0, y: bounds.midY),
            controlPoint2: CGPoint(x: bounds.width / 4.0, y: bounds.midY + bounds.height / 4.0))
        mountainPath.addCurve(
            to: CGPoint(x: bounds.maxX, y: bounds.midY),
            controlPoint1: CGPoint(x: bounds.width / 2 + bounds.width / 4.0, y: bounds.midY + bounds.height / 4.0),
            controlPoint2: CGPoint(x: bounds.width / 2 + bounds.width / 4.0, y: bounds.midY))
        mountainPath.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        mountainPath.addLine(to: CGPoint(x: 0, y: bounds.maxY))
        mountainPath.close()
        
        let mountain = CAShapeLayer()
        mountain.strokeColor = UIColor.green.cgColor
        mountain.lineWidth = 5.0
        mountain.path = mountainPath.cgPath
        
        layer.addSublayer(mountain)
        
        let radius: CGFloat = 32.0
        let padding: CGFloat = 16.0
        let sunCenter = CGPoint(x: bounds.maxX - radius - padding, y: radius + padding)
        let sunPath = UIBezierPath.circle(with: sunCenter, radius: radius)
        let sun = CAShapeLayer()
        sun.path = sunPath.cgPath
        sun.fillColor = UIColor.yellow.cgColor
        sun.shadowColor = UIColor.yellow.cgColor
        sun.shadowRadius = 16.0
        
        layer.addSublayer(sun)
    }

}

extension UIBezierPath {
    static func circle(with center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: center.x, y: center.y), radius: radius, startAngle: 0.0, endAngle: CGFloat.pi * 2.0, clockwise: true)
        
        return path
    }
}
