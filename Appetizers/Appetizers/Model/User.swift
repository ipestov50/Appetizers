//
//  User.swift
//  Appetizers
//
//  Created by Ivan Pestov on 27.06.2022.
//

import Foundation

struct User: Codable {
    
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefils  = false
}
