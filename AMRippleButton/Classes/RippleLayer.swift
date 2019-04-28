//
// Copyright © 2019 kaname ohara. All rights reserved.
//

import UIKit
import Foundation

class RippleLayer: CAShapeLayer {
    
    private let kExpandRippleBeyondSurface = CGFloat(10)
    private let kRippleStartingScale = CGFloat(0.6)
    private let kRippleFadeInDuration = CFTimeInterval(0.075)
    private let kRippleFadeOutDuration = CFTimeInterval(0.075)
    private let kRippleTouchDownDuration = CFTimeInterval(0.225)
    
    private var rippleRadius = CGFloat(0)

    /**
     A bool indicating if the start animation is currently active for this ripple layer.
     */
    private(set) var startAnimationActive = false
    
    private var isTouchUp = false
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        
        setRadiiWithRect(rect: bounds)
        setPathFromRadii()
        position = CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    func setRadiiWithRect(rect: CGRect) {
        rippleRadius = hypot(rect.midX, rect.midY) + kExpandRippleBeyondSurface
    }
    
    func setPathFromRadii() {
        let ovalRect = CGRect(x: bounds.midX - rippleRadius,
                              y: bounds.midY - rippleRadius,
                              width: rippleRadius * 2,
                              height: rippleRadius * 2)
        let circlePath = UIBezierPath(ovalIn: ovalRect)
        path = circlePath.cgPath
    }
    
    func startRipple(point: CGPoint) {
        
        setPathFromRadii()
        opacity = 1
        position = CGPoint(x: bounds.midX, y: bounds.midY)
        
        startAnimationActive = true
        
        let scaleAnim = CABasicAnimation()
        scaleAnim.keyPath = "transform.scale"
        scaleAnim.fromValue = kRippleStartingScale
        scaleAnim.toValue = 1
        //scaleAnim.timingFunction = CAMediaTimingFunction(name: .default)
        scaleAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

        let centerPath = UIBezierPath()
        let startPoint = point
        let endPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        centerPath.move(to: startPoint)
        centerPath.addLine(to: endPoint)
        centerPath.close()
        
        let positionAnim = CAKeyframeAnimation()
        positionAnim.keyPath = "position"
        positionAnim.path = centerPath.cgPath
        positionAnim.keyTimes = [0, 1]
        positionAnim.values = [0, 1]
        //positionAnim.timingFunction = CAMediaTimingFunction(name: .default)
        positionAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        let fadeInAnim = CABasicAnimation()
        fadeInAnim.keyPath = "opacity"
        fadeInAnim.fromValue = 0
        fadeInAnim.toValue = 1
        fadeInAnim.duration = CFTimeInterval(kRippleFadeInDuration)
        //fadeInAnim.timingFunction = CAMediaTimingFunction(name: .linear)
        fadeInAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        CATransaction.begin()
        let animGroup = CAAnimationGroup()
        animGroup.animations = [scaleAnim, positionAnim, fadeInAnim]
        animGroup.duration = kRippleTouchDownDuration
        CATransaction.setCompletionBlock { [weak self] in
            guard let strongSelf = self else { return }

            strongSelf.startAnimationActive = false
            if strongSelf.isTouchUp {
                strongSelf.fadeOut()
            }
        }
        add(animGroup, forKey: nil)
        CATransaction.commit()
    }
    
    /// Call this UIResponder # touchesEnded and touchesCancelled
    ///
    /// - Parameter touches:
    func touchUp(point: CGPoint) {
        if startAnimationActive {
            // user touch-up before ripple effect completion. so we will start fadeout animation when ripple completion.
            isTouchUp = true
        } else {
            // startAnimation right now.
            fadeOut()
        }
    }

    /// start fadeout animation
    private func fadeOut() {
        opacity = 0
        position = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let fadeOutAnim = CABasicAnimation()
        fadeOutAnim.keyPath = "opacity"
        fadeOutAnim.fromValue = 1
        fadeOutAnim.toValue = 0
        fadeOutAnim.duration = kRippleFadeOutDuration
        //fadeOutAnim.timingFunction = CAMediaTimingFunction(name: .linear)
        fadeOutAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        CATransaction.begin()
        let animGroup = CAAnimationGroup()
        animGroup.animations = [fadeOutAnim]
        animGroup.duration = kRippleTouchDownDuration
        CATransaction.setCompletionBlock { [weak self] in
            self?.removeFromSuperlayer()
        }
        
        add(animGroup, forKey: nil)
        CATransaction.commit()
    }
}
