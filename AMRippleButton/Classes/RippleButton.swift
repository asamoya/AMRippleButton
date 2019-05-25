//
// Copyright © 2019 kaname ohara. All rights reserved.
//

import UIKit

@IBDesignable
public class RippleButton: UIButton, Ripplable, Borderable {

    public override init(frame: CGRect) {
        super.init(frame: frame)

        borderColor = tintColor
        layer.borderColor = tintColor.cgColor
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        borderColor = tintColor
        layer.borderColor = tintColor.cgColor
    }

    // MARK: - Ripplable
    
    @IBInspectable
    public var rippleColor: UIColor? = nil

    // MARK: - Borderable
    
    @IBInspectable
    public var borderColor: UIColor = UIButton().tintColor {
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

        // make borderColor transparent while pressing
        let toAlpha = borderColor.cgColor.alpha > 0.2 ? CGFloat(0.2) : CGFloat(0.0)
        layer.borderColor = borderColor.withAlphaComponent(toAlpha).cgColor
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchUp(touches: touches)
        layer.borderColor = borderColor.cgColor

        super.touchesEnded(touches, with: event)
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchUp(touches: touches)
        layer.borderColor = borderColor.cgColor

        super.touchesCancelled(touches, with: event)
    }
}
