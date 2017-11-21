
import UIKit

class HamburgerToQuit: Hamburger {
    
    private(set) var isQuit: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeHamburger()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initializeHamburger()
    }
    
    func toQuit() {
        // TOP STROKE ANIMATION
        let strokePath = UIBezierPath()
        strokePath.move(to: CGPoint(x: 0, y: 0))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        let topAnimation = CABasicAnimation(keyPath: "path")
        topAnimation.toValue = strokePath.cgPath
        topAnimation.duration = animationDuration
        topAnimation.fillMode = kCAFillModeForwards
        topAnimation.isRemovedOnCompletion = false
        topStroke.add(topAnimation, forKey: "topStrokeAnimationQuit")
        
        // MIDDLE STROKE ANIMATION
        let middleAnimation = CABasicAnimation(keyPath: "opacity")
        middleAnimation.toValue = 0.0
        middleAnimation.duration = animationDuration
        middleAnimation.fillMode = kCAFillModeForwards
        middleAnimation.isRemovedOnCompletion = false
        middleStroke.add(middleAnimation, forKey: "middleStrokeAnimationQuit")
        
        // BOTTOM STROKE ANIMATION
        strokePath.removeAllPoints()
        strokePath.move(to: CGPoint(x: 0, y: self.frame.height))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: 0))
        let bottomAnimation = CABasicAnimation(keyPath: "path")
        bottomAnimation.toValue = strokePath.cgPath
        bottomAnimation.duration = animationDuration
        bottomAnimation.fillMode = kCAFillModeForwards
        bottomAnimation.isRemovedOnCompletion = false
        bottomStroke.add(bottomAnimation, forKey: "bottomStrokeAnimationQuit")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if isQuit == false {
            toQuit()
            isQuit = true
        }
        else {
            toHamburger()
            isQuit = false
        }
    }
}
