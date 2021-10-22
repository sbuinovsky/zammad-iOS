//
//  Ticket.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import Foundation
import UIKit

class Ticket {
    var number: String
    var title: String
    var status: String
    var priority: String
    var group: String
    var owner: String
    
    init(number: String, title: String, status: String,
         priority: String,group: String, owner: String) {
        self.number = number
        self.title = title
        self.status = status
        self.priority = priority
        self.group = group
        self.owner = owner
    }
}
