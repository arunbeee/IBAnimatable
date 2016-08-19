//
//  Created by Tom Baranes on 09/04/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit

open class PresentFoldSegue: UIStoryboardSegue {
  open override func perform() {
    
    destination.transitioningDelegate = PresenterManager.sharedManager().retrievePresenter(.fold(fromDirection: .left, params: []))
    source.present(destination, animated: true, completion: nil)
  }
}
