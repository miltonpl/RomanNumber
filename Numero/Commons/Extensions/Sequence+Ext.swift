//
//  Sequence+Ext.swift
//  Numero
//
//  Created by Milton Palaguachi on 2/19/21.
//  Copyright © 2021 Facebook. All rights reserved.
//

import Foundation

extension Sequence {
  /// Returns an array with the contents of this sequence, shuffled.
  func shuffled() -> [Element] {
    var result = Array(self)
    result.shuffle()
    return result
  }
}
