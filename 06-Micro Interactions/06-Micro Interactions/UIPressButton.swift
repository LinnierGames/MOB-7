//
//  UIPressButton.swift
//  06-Micro Interactions
//
//  Created by Erick Sanchez on 5/22/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class UIPressButton: UIControl {
    
    private var touchDown = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initLayout()
    }
    
    // MARK: - RETURN VALUES
    
    // MARK: - VOID METHODS
    
    private lazy var bottomFill: CAShapeLayer = {
        return CAShapeLayer()
    }()
    
    private func initLayout() {
    }
    
    private func didTouchDown() {
        self.sendActions(for: .touchDown)
        
    }
    
    private func didTouchUpInside() {
        self.sendActions(for: .touchUpInside)
        
    }
    
    private func didTouchUpOutside() {
        self.sendActions(for: .touchUpOutside)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: nil)
            
            if self.bounds.contains(location) {
                self.touchDown = true
                didTouchDown()
            }
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: nil)
            
            if touchDown {
                touchDown = false
                if self.bounds.contains(location) {
                    didTouchUpInside()
                } else {
                    didTouchUpOutside()
                }
            }
        }
        super.touchesEnded(touches, with: event)
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE

}
