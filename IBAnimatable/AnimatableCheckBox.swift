//
//  Created by Jake Lin on 12/20/15.
//  Copyright © 2015 IBAnimatable. All rights reserved.
//

import UIKit

@IBDesignable open class AnimatableCheckBox: UIButton, CheckBoxDesignable, CornerDesignable, FillDesignable, BorderDesignable, ShadowDesignable, MaskDesignable, Animatable {
  
  // MARK: - CheckBoxDesignable
  @IBInspectable open var checked: Bool = false {
    didSet {
      configCheckBoxChecked()
    }
  }
  
  @IBInspectable open var checkedImage: UIImage? = nil {
    didSet {
      configCheckBoxCheckedImage()
    }
  }
  
  @IBInspectable open var uncheckedImage: UIImage? = nil {
    didSet {
      configCheckBoxUncheckedImage()
    }
  }
  
  // MARK: - CornerDesignable
  @IBInspectable open var cornerRadius: CGFloat = CGFloat.nan {
    didSet {
      configCornerRadius()
    }
  }
  
  // MARK: - FillDesignable
  @IBInspectable open var fillColor: UIColor? {
    didSet {
      configFillColor()
    }
  }
  
  @IBInspectable open var predefinedColor: String? {
    didSet {
      configFillColor()
    }
  }
  
  @IBInspectable open var opacity: CGFloat = CGFloat.nan {
    didSet {
      configOpacity()
    }
  }
  
  // MARK: - BorderDesignable
  @IBInspectable open var borderColor: UIColor? {
    didSet {
      configBorder()
    }
  }
  
  @IBInspectable open var borderWidth: CGFloat = CGFloat.nan {
    didSet {
      configBorder()
    }
  }
  
  open var borderSides: BorderSides  = .AllSides {
    didSet {
      configBorder()
    }
  }
  
  @IBInspectable var _borderSides: String? {
    didSet {
      borderSides = BorderSides(rawValue: _borderSides)
    }
  }  
  // MARK: - ShadowDesignable
  @IBInspectable open var shadowColor: UIColor? {
    didSet {
      configShadowColor()
    }
  }
  
  @IBInspectable open var shadowRadius: CGFloat = CGFloat.nan {
    didSet {
      configShadowRadius()
    }
  }
  
  @IBInspectable open var shadowOpacity: CGFloat = CGFloat.nan {
    didSet {
      configShadowOpacity()
    }
  }
  
  @IBInspectable open var shadowOffset: CGPoint = CGPoint(x: CGFloat.nan, y: CGFloat.nan) {
    didSet {
      configShadowOffset()
    }
  }
  
  // MARK: - MaskDesignable
  open var maskType: MaskType = .none {
    didSet {
      configMask()
      configBorder()
    }
  }
  
  /// The mask type used in Interface Builder. **Should not** use this property in code.
  @IBInspectable var _maskType: String? {
    didSet {
      maskType = MaskType(string: _maskType)
    }
  }
  
  // MARK: - Animatable
open var animationType: AnimationType = .none
@IBInspectable  var _animationType: String? {
    didSet {
     animationType = AnimationType(string: _animationType)
    }
  }
  @IBInspectable open var autoRun: Bool = true
  @IBInspectable open var duration: Double = Double.nan
  @IBInspectable open var delay: Double = Double.nan
  @IBInspectable open var damping: CGFloat = CGFloat.nan
  @IBInspectable open var velocity: CGFloat = CGFloat.nan
  @IBInspectable open var force: CGFloat = CGFloat.nan
  @IBInspectable open var repeatCount: Float = Float.nan
  
  // MARK: - Lifecycle
  open override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
    configInspectableProperties()
  }
  
  open override func awakeFromNib() {
    super.awakeFromNib()
    setup()
    configInspectableProperties()
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    configAfterLayoutSubviews()
    autoRunAnimation()
  }
  
  open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if isTouchInside {
      checked = !checked
      sendActions(for: .valueChanged)
    }
    super.touchesEnded(touches, with: event)
  }
  
  // MARK: - Private
  fileprivate func setup() {
    // No title for CheckBox
    setTitle("", for: UIControlState())
    tintColor = .clear
  }
  
  fileprivate func configInspectableProperties() {
    configAnimatableProperties()
  }
  
  fileprivate func configAfterLayoutSubviews() {
    configMask()
    configBorder()
  }
}
