
import UIKit

class Hamburger: UIButton {
    
    public var animationDuration: CFTimeInterval = 0.5
    public var strokesColor: UIColor = UIColor.black {
        didSet {
            initializeHamburger(with: strokesColor)
        }
    }
    
    internal let topStroke = CAShapeLayer()
    internal let middleStroke = CAShapeLayer()
    internal let bottomStroke = CAShapeLayer()
    
    internal func initializeHamburger(with color: UIColor) {
        // TOP STROKE
        let strokePath = UIBezierPath()
        strokePath.move(to: CGPoint(x: 0, y: 0))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: 0))
        topStroke.path = strokePath.cgPath
        topStroke.lineWidth = 5.0
        topStroke.strokeColor = strokesColor.cgColor
        topStroke.lineCap = kCALineCapRound
        layer.addSublayer(topStroke)
        
        // MIDDLE STROKE
        strokePath.removeAllPoints()
        strokePath.move(to: CGPoint(x: 0, y: self.frame.height / 2))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height / 2))
        middleStroke.path = strokePath.cgPath
        middleStroke.lineWidth = 5.0
        middleStroke.strokeColor = strokesColor.cgColor
        middleStroke.lineCap = kCALineCapRound
        layer.addSublayer(middleStroke)
        
        // BOTTOM STROKE
        strokePath.removeAllPoints()
        strokePath.move(to: CGPoint(x: 0, y: self.frame.height))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        bottomStroke.path = strokePath.cgPath
        bottomStroke.lineWidth = 5.0
        bottomStroke.strokeColor = strokesColor.cgColor
        bottomStroke.lineCap = kCALineCapRound
        layer.addSublayer(bottomStroke)
    }
    
    func toHamburger() {
        // TOP STROKE ANIMATION
        let strokePath = UIBezierPath()
        strokePath.move(to: CGPoint(x: 0, y: 0))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: 0))
        let topAnimation = CABasicAnimation(keyPath: "path")
        topAnimation.toValue = strokePath.cgPath
        topAnimation.duration = animationDuration
        topAnimation.fillMode = kCAFillModeForwards
        topAnimation.isRemovedOnCompletion = false
        topStroke.add(topAnimation, forKey: "topStrokeAnimationHamburger")
        
        // MIDDLE STROKE ANIMTION
        let middleAnimation = CABasicAnimation(keyPath: "opacity")
        middleAnimation.toValue = 1.0
        middleAnimation.duration = animationDuration
        middleAnimation.fillMode = kCAFillModeForwards
        middleAnimation.isRemovedOnCompletion = false
        middleStroke.add(middleAnimation, forKey: "middleStrokeAnimationHamburger")
        
        // BOTTOM STROKE ANIMATION
        strokePath.removeAllPoints()
        strokePath.move(to: CGPoint(x: 0, y: self.frame.height))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        let bottomAnimation = CABasicAnimation(keyPath: "path")
        bottomAnimation.toValue = strokePath.cgPath
        bottomAnimation.duration = animationDuration
        bottomAnimation.fillMode = kCAFillModeForwards
        bottomAnimation.isRemovedOnCompletion = false
        bottomStroke.add(bottomAnimation, forKey: "bottomStrokeAnimationHamburger")
    }
}
