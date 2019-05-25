//
// Copyright © 2019 kaname ohara. All rights reserved.
//

import UIKit

/// Protocol to add border to UIButton
public protocol Borderable: UIButton {

    /// color of border line
    /// set as stored property and didset {layer.borderColor = borderColor.cgColor}
    var borderColor: UIColor { get set }

    /// line width of border
    /// set as stored property didSet { layer.borderWidth = borderWidth }
    var borderWidth: CGFloat { get set }

    /// corner radius of button background
    /// set as stored property didSet { layer.cornerRadius = cornerRadius layer.masksToBounds = cornerRadius > 0 }
    var cornerRadius: CGFloat { get set }
}
