//
//  Created by Mark Hamilton on 4/9/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

// Source: https://gist.github.com/TheDarkCode/2f65c1a25d5886ed210c3b33d73fe8a9
// Based on earlier version: http://stackoverflow.com/a/28341290/749786
public func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
  var x = 0
  return AnyIterator {
    let next = withUnsafePointer(&x) {
      UnsafePointer<T>($0).pointee
    }
    defer {
      x += 1
    }
    return next.hashValue == x ? next : nil
  }
}
