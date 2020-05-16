//
// Copyright © 2019-2020 kaname ohara. All rights reserved.
//

import UIKit

/// ripple effect. Please add @IBDesignable
public protocol Ripplable: UIButton {
    
    /// Please add @IBInspectable annotation
    var rippleColor: UIColor? { get set }

    /// call this method @UIResponder # touchesBegan()
    ///
    /// - Parameter touches: touches
    func touchDown(touches: Set<UITouch>)
    
    /// call this method @UIResponder # touchesEnded() and # touchesCancelled()
    ///
    /// - Parameter touches: touches
    func touchUp(touches: Set<UITouch>)
}

public extension Ripplable {

    func touchDown(touches: Set<UITouch>) {
        guard let point = touches.first?.location(in: self) else { return }

        clipsToBounds = true
        
        if let rippleLayer = findRippleLayer() {
            //already rippled -> remove previous one
            rippleLayer.removeFromSuperlayer()
        }

        // default rippleColor is tintColor
        let color = rippleColor == nil ? tintColor! : rippleColor!

        if color.cgColor.alpha < 0.25 {
            return
        }

        let rippleLayer = RippleLayer()
        rippleLayer.fillColor = color.withAlphaComponent(0.15).cgColor
        rippleLayer.frame = bounds
        layer.addSublayer(rippleLayer)
        rippleLayer.startRipple(point: point)
    }
    
    func touchUp(touches: Set<UITouch>) {
        guard let point = touches.first?.location(in: self) else { return }
        
        guard let rippleLayer = findRippleLayer() else { return }
        rippleLayer.touchUp(point: point)
    }

    // MARK: - private function

    /// find rippleLayer. RippleLayer must be only one
    ///
    /// - Returns: a rippleLayer or nil
    private func findRippleLayer() -> RippleLayer? {
        guard let layers = layer.sublayers else { return nil }
        
        for layer in layers {
            guard let rippleLayer = layer as? RippleLayer else { continue }
            return rippleLayer
        }
        return nil
    }
}
