
import Foundation
import UIKit

class HamburgerButton: UIButton {
    
    enum StrokeAnimationKey: String {
        case topHamburger = "topStrokeAnimationHamburger"
        case middleHamburger = "middleStrokeAnimationHamburger"
        case bottomHamburger = "bottomStrokeAnimationHamburger"
        case topQuit = "topStrokeAnimationQuit"
        case middleQuit = "middleStrokeAnimationQuit"
        case bottomQuit = "bottomStrokeAnimationQuit"
    }
    
    enum AnimationKey: String {
        case path = "path"
        case opacity = "opacity"
    }
    
    enum AnimationEndValue {
        case toHamburger
        case toQuit
        
        func getStrokePathValue() -> CGPath {
            switch self {
            case .toHamburger:
                return 1.0 as! CGPath
            case .toQuit:
                return 0.0 as! CGPath
            }
        }
    }
    
    public var animationDuration: CFTimeInterval = 0.5
    public var lineWidth: CGFloat = 2.0
    public var strokesColor: UIColor = UIColor.white {
        didSet {
            initializeHamburger(with: strokesColor)
        }
    }
    
    private let topStroke = CAShapeLayer()
    private let middleStroke = CAShapeLayer()
    private let bottomStroke = CAShapeLayer()
    
    private let frameHeight: CGFloat
    private let frameWidth: CGFloat
    private let frameX: CGFloat
    private let frameY: CGFloat
    private let paddingX: CGFloat = 5.0
    private let paddingY: CGFloat = 7.0
    
    var showsMenu: Bool = false {
        didSet {
            self.showsMenu ? toQuit() : toHamburger()
        }
    }
    
    override init(frame: CGRect) {
        frameX = frame.origin.x + paddingX
        frameY = frame.origin.y + paddingY
        frameWidth = frame.width + paddingX
        frameHeight = frame.height
        
        super.init(frame: frame)

        initializeHamburger(with: UIColor.white)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func moveAndAddLine(origin: CGPoint, lineEnd: CGPoint) -> UIBezierPath {
        let strokePath = UIBezierPath()
        strokePath.move(to: CGPoint(x: origin.x, y: origin.y))
        strokePath.addLine(to: CGPoint(x: lineEnd.x, y: lineEnd.y))
        return strokePath
    }
    
    private func createStrokeLine(origin: CGPoint, lineEnd: CGPoint, stroke: CAShapeLayer) {
        let strokePath = moveAndAddLine(origin: origin, lineEnd: lineEnd)
        stroke.path = strokePath.cgPath
        stroke.lineWidth = lineWidth
        stroke.strokeColor = strokesColor.cgColor
        stroke.lineCap = .round
        
        layer.addSublayer(stroke)
    }
    
    private func initializeHamburger(with color: UIColor) {
        // TOP STROKE
        createStrokeLine(origin: CGPoint(x: frameX, y: frameY), lineEnd: CGPoint(x: frameWidth, y: frameY), stroke: topStroke)
        
        // MIDDLE STROKE
        createStrokeLine(origin: CGPoint(x: frameX, y: (frameHeight / 2) + paddingY), lineEnd: CGPoint(x: frameWidth, y: (frameHeight / 2) + paddingY), stroke: middleStroke)
        
        // BOTTOM STROKE
        createStrokeLine(origin: CGPoint(x: frameX, y: frameHeight + paddingY), lineEnd: CGPoint(x: frameWidth, y: frameHeight + paddingY), stroke: bottomStroke)
    }
    
    private func animateStroke(origin: CGPoint, lineEnd: CGPoint, animationKey: AnimationKey, stroke: CAShapeLayer, strokeAnimationKey: StrokeAnimationKey) {
        let strokePath = moveAndAddLine(origin: origin, lineEnd: lineEnd)
        let animation = addAnimationToStroke(animationKey: animationKey, strokePath: strokePath, strokeAnimationKey: strokeAnimationKey)
        guard let animation = animation else {
            return
        }
        stroke.add(animation, forKey: strokeAnimationKey.rawValue)
    }
    
    private func addAnimationToStroke(animationKey: AnimationKey, strokePath: UIBezierPath? = nil, strokeAnimationKey: StrokeAnimationKey) -> CABasicAnimation? {
        let animation = CABasicAnimation(keyPath: animationKey.rawValue)
        if animationKey == .path  {
            guard let strokePath = strokePath else {
                return nil
            }
            animation.toValue = strokePath.cgPath
        } else {
            animation.toValue = strokeAnimationKey == .middleHamburger ? 1.0 : 0.0
        }
        animation.duration = animationDuration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    func toHamburger() {
        // TOP STROKE ANIMATION
        animateStroke(origin: CGPoint(x: frameX, y: frameY), lineEnd: CGPoint(x: frameWidth, y: frameY), animationKey: .path, stroke: topStroke, strokeAnimationKey: .topHamburger)
        
        // MIDDLE STROKE ANIMTION
        animateStroke(origin: CGPoint(x: frameX, y: (frameHeight / 2) + paddingY), lineEnd: CGPoint(x: frameWidth, y: (frameHeight / 2) + paddingY), animationKey: .opacity, stroke: middleStroke, strokeAnimationKey: .middleHamburger)
        
        // BOTTOM STROKE ANIMATION
        animateStroke(origin: CGPoint(x: frameX, y: frameHeight + paddingY), lineEnd: CGPoint(x: frameWidth, y: frameHeight + paddingY), animationKey: .path, stroke: bottomStroke, strokeAnimationKey: .bottomHamburger)
    }
    
    func toQuit() {
        // TOP STROKE ANIMATION
        animateStroke(origin: CGPoint(x: frameX, y: frameY), lineEnd: CGPoint(x: frameWidth, y: frameHeight + paddingY), animationKey: .path, stroke: topStroke, strokeAnimationKey: .topQuit)
        
        // MIDDLE STROKE ANIMATION
        let animation = addAnimationToStroke(animationKey: .opacity, strokePath: nil, strokeAnimationKey: .middleQuit)
        guard let animation = animation else {
            return
        }
        middleStroke.add(animation, forKey: StrokeAnimationKey.middleQuit.rawValue)
        
        // BOTTOM STROKE ANIMATION
        animateStroke(origin: CGPoint(x: frameX, y: frameHeight + paddingY), lineEnd: CGPoint(x: frameWidth, y: frameY), animationKey: .path, stroke: bottomStroke, strokeAnimationKey: .bottomQuit)
    }
}
