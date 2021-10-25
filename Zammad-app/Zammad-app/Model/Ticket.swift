//
//  Ticket.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import Foundation
import UIKit

class Ticket {
    var id: Int
    var title: String
    var status: Status
    var priority: Priority
    var customer: User
    var owner: User
    var group: String {
        owner.organization
    }
    var ownerName: String {
        owner.shortName
    }
    
    init(id: Int, title: String, status: Status,
         priority: Priority, customer: User, owner: User) {
        self.id = id
        self.title = title
        self.status = status
        self.priority = priority
        self.customer = customer
        self.owner = owner
    }
}
