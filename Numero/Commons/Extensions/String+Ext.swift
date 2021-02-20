//
//  String+Ext.swift
//  Numero
//
//  Created by Milton Palaguachi on 2/19/21.
//  Copyright © 2021 Facebook. All rights reserved.
//

import Foundation
extension String {
  func garbled() -> String {
    return String(shuffled())
  }
}
