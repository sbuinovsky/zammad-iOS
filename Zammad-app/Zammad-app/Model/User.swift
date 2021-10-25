//
//  User.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 24.10.2021.
//

import Foundation

class User {
    
    let id: Int
    var firstName: String
    var lastName: String
    var email: String
    var organization: String
    var isVIP: Bool
    var web = ""
    var phone = ""
    var mobile = ""
    var address = ""
    var group = ""
    
    var shortName: String {
        if firstName.first != nil {
            return "\(String(describing: firstName.first!)). \(lastName)"
        } else {
            return lastName
        }
        
    }
    
    init(id: Int, firstName: String, lastName: String, email: String,
         organization: String, isVIP: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.organization = organization
        self.isVIP = isVIP
    }
}
