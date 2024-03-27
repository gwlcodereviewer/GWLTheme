//
//  LocalizableDelegate.swift
//  BizTalk
//
//  Created by Sumit Jagdev on 29/10/19.
//  Copyright © 2019 GalaxyWeblinks. All rights reserved.
//

import Foundation

protocol LocalizableProtocol {
    var rawValue: String { get }    //localize key
    var table: String? { get }
    var localized: String { get }
}
extension LocalizableProtocol {

    //returns a localized value by specified key located in the specified table
    var localized: String {
        return Bundle.main.localizedString(forKey: rawValue, value: nil, table: table)
    }

    // file name, where to find the localized key
    // by default is the Localizable.string table
    var table: String? {
        return nil
    }
}

extension String {
    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }
  func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
