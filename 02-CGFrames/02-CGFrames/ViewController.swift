//
//  ViewController.swift
//  02-CGFrames
//
//  Created by Erick Sanchez on 5/1/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

enum Exercise {
  case RedView
  case ChessBoard
  case StackView
  case Rects
  case Pattern
}

let exercie: Exercise = .Pattern

class ViewController: UIViewController {
  
  private func getAllColors(by intervalOffset: CGFloat = 0.1) -> [UIColor] {
    var colors = [UIColor]()
    var currentHue: CGFloat = 0.0
    
    while currentHue < 1.0 {
      colors.append(UIColor(hue: currentHue, saturation: 1, brightness: 1, alpha: 1))
      
      currentHue += intervalOffset
    }
    
    return colors
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    switch exercie {
    case .RedView:
      
      let screenSize = UIScreen.main.bounds.insetBy(dx: 20, dy: 20)
      
      let myRedView = UIView(frame: screenSize)
      myRedView.backgroundColor = .red
      
      self.view.addSubview(myRedView)
      
    case .ChessBoard:
      for x in 0...3 {
        for y in 0...3 {
          let backView = UIView(frame: CGRect(x: x * 64, y: y * 64, width: 32, height: 32))
          backView.backgroundColor = .black
          
          self.view.addSubview(backView)
        }
      }
      
      for x in 0...3 {
        for y in 0...3 {
          let backView = UIView(frame: CGRect(x: x * 64 + 32, y: y * 64 + 32, width: 32, height: 32))
          backView.backgroundColor = .black

          self.view.addSubview(backView)
        }
      }
      self.view.backgroundColor = .gray
      
    case .StackView:
      let screenRect = UIScreen.main.bounds
      let colors: [UIColor] = getAllColors()
      let colorHeight = CGFloat(screenRect.size.height / CGFloat(colors.count))
      
      for (index, aColor) in colors.enumerated() {
        let colorView = UIView(frame: CGRect(x: 0, y: CGFloat(index) * colorHeight, width: screenRect.size.width, height: colorHeight))
        colorView.backgroundColor = aColor
        
        self.view.addSubview(colorView)
      }
    case .Rects:
      let screenRect = UIScreen.main.bounds
      let nViews = 4
      let insetOffset: CGFloat = 20.0
      
      var currentSaturation: CGFloat = 1.0
      var currentRect = screenRect
      for _ in 0...nViews - 1 {
        let rect = UIView(frame: currentRect)
        rect.backgroundColor = UIColor(hue: 1.0, saturation: currentSaturation, brightness: 1.0, alpha: 1.0)
        self.view.addSubview(rect)
        
        currentRect = currentRect.insetBy(dx: insetOffset, dy: insetOffset)
        currentSaturation -= 1.0 / CGFloat(nViews)
      }
    case .Pattern:
      let pattern = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
      self.view.backgroundColor = pattern
      
      let screenRect = UIScreen.main.bounds

      let halfScreenSize = screenRect.size.width / 2.0
      let squareSize = halfScreenSize
      
      for x in 0...1 {
        for y in 0...2 {
          let blackBoxRect = CGRect(x: CGFloat(x) * squareSize, y: CGFloat(y) * squareSize, width: squareSize, height: squareSize).insetBy(dx: 20.0, dy: 20.0)
          let blackBox = UIView(frame: blackBoxRect)
          blackBox.backgroundColor = .black
          self.view.addSubview(blackBox)
        }
      }
    } 
  }
}

