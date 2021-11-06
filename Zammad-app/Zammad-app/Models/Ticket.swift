//
//  Ticket.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import Foundation
import UIKit

struct Ticket {
    var id: Int
    var title: String
    var status: Status
    var priority: Priority
    var customer: User
    var owner: User
    var group: String {
        owner.organization
    }
    var organization: String {
        customer.organization
    }
    var ownerName: String {
        owner.shortName
    }
}


extension Ticket {
    enum Status: String, CaseIterable {
        case none = "None"
        case new = "New"
        case open = "Open"
        case closed = "Closed"
    }
}
