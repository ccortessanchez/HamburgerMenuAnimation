
import UIKit

class HamburgerToArrow: Hamburger {
    
    private(set) var isArrow: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeHamburger(with: UIColor.black)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initializeHamburger(with: UIColor.black)
    }
    
    func toArrow() {
        // TOP STROKE ANIMATION
        let strokePath = UIBezierPath()
        strokePath.move(to: CGPoint(x: 0, y: self.frame.height / 2))
        strokePath.addLine(to: CGPoint(x: self.frame.width / 2, y: 0))
        let topAnimation = CABasicAnimation(keyPath: "path")
        topAnimation.toValue = strokePath.cgPath
        topAnimation.duration = animationDuration
        topAnimation.fillMode = kCAFillModeForwards
        topAnimation.isRemovedOnCompletion = false
        topStroke.add(topAnimation, forKey: "topStrokeAnimationArrow")
        
        // BOTTOM STROKE ANIMATION
        strokePath.removeAllPoints()
        strokePath.move(to: CGPoint(x: 0, y: self.frame.height / 2))
        strokePath.addLine(to: CGPoint(x: self.frame.width / 2, y: self.frame.height))
        let bottomAnimation = CABasicAnimation(keyPath: "path")
        bottomAnimation.toValue = strokePath.cgPath
        bottomAnimation.duration = animationDuration
        bottomAnimation.fillMode = kCAFillModeForwards
        bottomAnimation.isRemovedOnCompletion = false
        bottomStroke.add(bottomAnimation, forKey: "bottomStrokeAnimationArrow")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if isArrow == false {
            toArrow()
            isArrow = true
        }
        else {
            toHamburger()
            isArrow = false
        }
    }
}
