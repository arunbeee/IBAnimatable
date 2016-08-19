//
//  Created by Tom Baranes on 02/04/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit

open class SystemMoveInAnimator: NSObject, AnimatedTransitioning {
  // MARK: - AnimatorProtocol
  open var transitionAnimationType: TransitionAnimationType
  open var transitionDuration: Duration = defaultTransitionDuration
  open var reverseAnimationType: TransitionAnimationType?
  open var interactiveGestureType: InteractiveGestureType?
  
  // MARK: - private
  fileprivate var fromDirection: TransitionDirection
  
  public init(fromDirection: TransitionDirection, transitionDuration: Duration) {
    self.fromDirection = fromDirection
    self.transitionDuration = transitionDuration
    
    switch fromDirection {
    case .right:
      self.transitionAnimationType = .systemMoveIn(fromDirection: .right)
      self.reverseAnimationType = .systemMoveIn(fromDirection: .left)
      self.interactiveGestureType = .pan(fromDirection: .left)
    case .top:
      self.transitionAnimationType = .systemMoveIn(fromDirection: .top)
      self.reverseAnimationType = .systemMoveIn(fromDirection: .bottom)
      self.interactiveGestureType = .pan(fromDirection: .bottom)
    case .bottom:
      self.transitionAnimationType = .systemMoveIn(fromDirection: .bottom)
      self.reverseAnimationType = .systemMoveIn(fromDirection: .top)
      self.interactiveGestureType = .pan(fromDirection: .top)
    default:
      self.transitionAnimationType = .systemMoveIn(fromDirection: .left)
      self.reverseAnimationType = .systemMoveIn(fromDirection: .right)
      self.interactiveGestureType = .pan(fromDirection: .right)
    }
    
    super.init()
  }
}

extension SystemMoveInAnimator: UIViewControllerAnimatedTransitioning {
  public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return getTransitionDuration(using: transitionContext)
  }
  
  public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    animateWithCATransition(using: transitionContext, type: SystemTransitionType.moveIn, subtype: fromDirection.CATransitionSubtype)
  }
}
