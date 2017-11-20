
import UIKit

class HamburgerToArrow: UIButton {
    
    var isArrow: Bool = false
    
    let topStroke = CAShapeLayer()
    let middleStroke = CAShapeLayer()
    let bottomStroke = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeHamburger()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initializeHamburger()
    }
    
    private func initializeHamburger() {
        // TOP STROKE
        let strokePath = UIBezierPath()
        strokePath.move(to: CGPoint(x: 0, y: 0))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: 0))
        topStroke.path = strokePath.cgPath
        topStroke.lineWidth = 5.0
        topStroke.strokeColor = UIColor.black.cgColor
        topStroke.lineCap = kCALineCapRound
        layer.addSublayer(topStroke)
        
        // MIDDLE STROKE
        strokePath.removeAllPoints()
        strokePath.move(to: CGPoint(x: 0, y: self.frame.width / 2))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.width / 2))
        middleStroke.path = strokePath.cgPath
        middleStroke.lineWidth = 5.0
        middleStroke.strokeColor = UIColor.black.cgColor
        middleStroke.lineCap = kCALineCapRound
        layer.addSublayer(middleStroke)
        
        // BOTTOM STROKE
        strokePath.removeAllPoints()
        strokePath.move(to: CGPoint(x: 0, y: self.frame.height))
        strokePath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        bottomStroke.path = strokePath.cgPath
        bottomStroke.lineWidth = 5.0
        bottomStroke.strokeColor = UIColor.black.cgColor
        bottomStroke.lineCap = kCALineCapRound
        layer.addSublayer(bottomStroke)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if isArrow == false {
            // TRANSFORM TO ARROW
            isArrow = true
        }
        else {
            // TRANSFORM TO HAMBURGER
            isArrow = false
        }
        // MOVE TO ARROW
    }
}
