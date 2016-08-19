//
//  Created by Tom Baranes on 09/04/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit

open class PresentFoldWithDismissInteractionSegue: UIStoryboardSegue {
  open override func perform() {
    destination.transitioningDelegate = PresenterManager.sharedManager().retrievePresenter(.fold(fromDirection: .left, params: []), interactiveGestureType: .default)
    source.present(destination, animated: true, completion: nil)
  }
}
