//
//  UIVuuu.swift
//  04-Motion
//
//  Created by Erick Sanchez on 5/8/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class UIVuuu: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        animate123Buttons()
        print("dont")
    }
    
    func animate123Buttons() {
        let nSquares = 5
        
        for index in 0..<nSquares {
            let squareLength: CGFloat = frame.size.width / CGFloat(nSquares)
            let squareRect = CGRect(
                x: CGFloat(index) * squareLength,
                y: bounds.maxY,
                width: squareLength,
                height: squareLength
            )
            let button = UIButton(type: .system)
            button.backgroundColor = .red
            button.setTitle(String(index + 1), for: .normal)
            button.frame = squareRect
            addSubview(button)
            
//            UIView.animate(withDuration: 1.0, delay: Double(index) / 6.0, options: .curveEaseIn, animations: {
//                var toValue = squareRect
//                toValue.origin.y -= squareLength
//                button.frame = toValue
//            })
            
            UIView.animate(
                withDuration: 1,
                delay: Double(index) / 6.0,
                usingSpringWithDamping: 0.1,
                initialSpringVelocity: 0.2,
                options: .curveLinear,
                animations: {
                    var toValue = squareRect
                    toValue.origin.y -= squareLength
                    button.frame = toValue
            })
        }
    }
    
    func animate123() {
        let nSquares = 5
        
        for index in 0..<nSquares {
            let squareLength: CGFloat = bounds.width / CGFloat(nSquares)
            let squareRect = CGRect(
                x: CGFloat(index) * squareLength,
                y: bounds.maxY + squareLength,
                width: squareLength,
                height: squareLength
            )
            let squarePath = UIBezierPath(roundedRect: squareRect, cornerRadius: 0.0)
            let squareShape = CATextLayer()
//            squareShape.path = squarePath.cgPath
            squareShape.frame = squareRect
            squareShape.string = String(index + 1)
            squareShape.foregroundColor = UIColor.blue.cgColor
            squareShape.borderColor = UIColor.red.cgColor
            squareShape.borderWidth = 1.0
            
            layer.addSublayer(squareShape)
            
            let animation = CABasicAnimation(keyPath: "frame")
            animation.fromValue = squareRect
            var toValue = squareRect
            toValue.origin.y -= squareLength
            animation.toValue = toValue
            animation.duration = 1.0
            squareShape.add(animation, forKey: "frame")
        }
    }
}
