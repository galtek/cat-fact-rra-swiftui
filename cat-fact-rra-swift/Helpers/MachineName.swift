//
//  MachineName.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/17/21.
//

import Foundation

func machineName() -> String {
  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo.machine)
  return machineMirror.children.reduce("") { identifier, element in
    guard let value = element.value as? Int8, value != 0 else { return identifier }
    return identifier + String(UnicodeScalar(UInt8(value)))
  }
}
