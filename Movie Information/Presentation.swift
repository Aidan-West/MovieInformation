import Foundation
import UIKit
import Hero


enum Direction {
    case right
    case left
    case up
    case down
    
}

var screenHeight = UIScreen.main.bounds.height
var screenWidth = UIScreen.main.bounds.width
var stringMultiplier = CGFloat()
var ScreenWidth_To_ScreenHeight_Converter = CGFloat()
var ScreenHeight_To_ScreenWidth_Converter = CGFloat()
var lastObjectFrane = CGRect()

func setDefaultSize(view : UIView){
    
    screenHeight = view.frame.size.height
    screenWidth = view.frame.size.width
    stringMultiplier = 0.00115 * screenHeight
    ScreenWidth_To_ScreenHeight_Converter = 1 / screenWidth * screenHeight / 2.1642
    ScreenHeight_To_ScreenWidth_Converter = 1 / screenHeight * screenWidth / 0.4620
    
}


func presentVC(currentVC : UIViewController, destinationVC : UIViewController, toDirection : Direction){
    
    
    switch toDirection {
    case .left:
        destinationVC.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .right), dismissing:.slide(direction: .left))
    case .right:
        destinationVC.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .left), dismissing:.slide(direction: .right))
    case .up:
        destinationVC.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .down), dismissing:.slide(direction: .up))
    case .down:
        destinationVC.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .up), dismissing:.slide(direction: .down))
    }
    
    
    destinationVC.isHeroEnabled = true
    destinationVC.modalPresentationStyle = .fullScreen
    currentVC.present(destinationVC, animated: true)
    
}

func presentVCWithoutAnimation(currentVC : UIViewController, destinationVC : UIViewController){
    destinationVC.modalPresentationStyle = .fullScreen
    currentVC.present(destinationVC, animated: false)
}


func presentAsPageSheet(currentVC : UIViewController, destinationVC : UIViewController){
    destinationVC.modalPresentationStyle = .pageSheet
    currentVC.present(destinationVC, animated: true)
}
