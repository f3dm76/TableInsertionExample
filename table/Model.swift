//
//  Model.swift
//  table
//
//  Created by Alisa Mylnikova on 02.03.2023.
//

import UIKit

struct Model: Equatable {

    var id = UUID().uuidString
    var text: String

    init() {
        self.text = Model.randomString(length: 50)
    }
    
    static func == (lhs: Model, rhs: Model) -> Bool {
        lhs.id == rhs.id
    }

    static func randomString(length: Int) -> String {
          let letters = "    abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
          return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
