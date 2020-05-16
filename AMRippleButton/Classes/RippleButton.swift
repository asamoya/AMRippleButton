//
// Copyright © 2019-2020 kaname ohara. All rights reserved.
//

import UIKit

@IBDesignable
open class RippleButton: UIButton, Ripplable {

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Ripplable
    
    @IBInspectable
    public var rippleColor: UIColor? = nil
    
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
