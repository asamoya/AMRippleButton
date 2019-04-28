//
// Copyright © 2019 kaname ohara. All rights reserved.
//

import UIKit

@IBDesignable
public class RippleButton: UIButton, Ripplable, Borderable {
    
    // MARK: - Ripplable
    
    @IBInspectable
    public var rippleColor: UIColor = .clear
    
    // MARK: - Borderable
    
    @IBInspectable
    public var borderColor: UIColor = .clear {
        didSet {
             layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    // MARK: - UIResponder
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        touchDown(touches: touches)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchUp(touches: touches)
        
        super.touchesEnded(touches, with: event)
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchUp(touches: touches)
        
        super.touchesCancelled(touches, with: event)
    }
}
