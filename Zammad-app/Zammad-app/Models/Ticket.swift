//
//  Ticket.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import UIKit

protocol TicketFilterProtocol {
    func fillFromTickets(with tickets: [Ticket]) -> Filter
    func filterTickets(for tickets: [Ticket], with filter: Filter) -> [Ticket]
}


struct Ticket {
    enum Status: String, CaseIterable {
        case none = "None"
        case new = "New"
        case open = "Open"
        case closed = "Closed"
    }
    
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
