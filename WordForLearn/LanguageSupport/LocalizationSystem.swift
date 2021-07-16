//
//  LocalizationSystem.swift
//  WordForLearn
//
//  Created by MacBook Air M1 on 13/7/21.
//


import Foundation
import UIKit



import Foundation

var bundleKey: UInt8 = 0

class AnyLanguageBundle: Bundle {

override func localizedString(forKey key: String,
                              value: String?,
                              table tableName: String?) -> String {
    guard let path = objc_getAssociatedObject(self, &bundleKey) as? String,
        let bundle = Bundle(path: path) else {
            return super.localizedString(forKey: key, value: value, table: tableName)
    }
    return bundle.localizedString(forKey: key, value: value, table: tableName)
  }
}

extension Bundle {

class func setLanguage(_ language: String) {

    defer {
        object_setClass(Bundle.main, AnyLanguageBundle.self)
    }
    objc_setAssociatedObject(Bundle.main, &bundleKey,    Bundle.main.path(forResource: language, ofType: "lproj"), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
}


extension String {
    func localizedStringForKey() -> String {
        return Bundle.main.localizedString(forKey: self, value: "", table: nil)
    }
}
