//
//  ViewController.swift
//  06-Micro Interactions
//
//  Created by Erick Sanchez on 5/22/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var animator = UIDynamicAnimator(referenceView: self.view)
    lazy var bounceOffBoundary = UIPushBehavior(items: [self.ball], mode: .instantaneous)

    // MARK: - RETURN VALUES
    
    // MARK: - VOID METHODS
    
    // MARK: - IBACTIONS
    
    @IBOutlet weak var ball: UIView!
    
    @IBAction func pressTouchDown(_ sender: Any) {
        print("Touch down")
    }
    
    @IBAction func pressButton(_ sender: Any) {
        print("press button")
    }
    
    @IBAction func touchOutside(_ sender: Any) {
        print("Touch up outside")
    }
    // MARK: - LIFE CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gravity = UIGravityBehavior(items: [ball])
        gravity.magnitude = 1
        
        let bounce = UICollisionBehavior(items: [ball])
        bounce.translatesReferenceBoundsIntoBoundary = true
        bounce.collisionDelegate = self
        
        bounceOffBoundary.active = true
        bounceOffBoundary.angle = .pi / 2.0
        bounceOffBoundary.magnitude = 1
        
        animator.addBehavior(gravity)
        animator.addBehavior(bounce)
    }

}

extension ViewController: UICollisionBehaviorDelegate {
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let screenRect = UIScreen.main.bounds
        let centerOfScreen = CGPoint(
            x: screenRect.midX,
            y: screenRect.midY
        )
        
        let centerOfView = ball.center
        
        let o = centerOfScreen.x - centerOfView.x
        let a = centerOfScreen.y - centerOfView.y
        let theta: CGFloat = tan(o / a)
        let angleToCenterOfScreen: CGFloat = CGFloat.pi / 4 - theta
        
        bounceOffBoundary.angle = angleToCenterOfScreen
        bounceOffBoundary.active = true
    }
}
