//
//  User.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 24.10.2021.
//

import Foundation

class User: Equatable, Hashable {
    
    let id: Int
    var firstName: String
    var lastName: String
    var email: String
    var organization: String
    var isVIP = false
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
    
    //MARK: - Initialization
    init(id: Int, firstName: String, lastName: String, email: String,
         organization: String, isVIP: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.organization = organization
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id.hashValue == rhs.id.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
