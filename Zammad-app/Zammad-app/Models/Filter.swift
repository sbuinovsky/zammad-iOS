//
//  Filter.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 07.11.2021.
//

import UIKit

class Filter {
    var priorities: [Priority] = []
    var owners: [User] = []
    var groups: [String] = []
    
    func cleanValues() {
        priorities = []
        owners = []
        groups = []
    }
    
    func fillValues(with tickets: [Ticket]) -> Filter {
        for ticket in tickets {
            priorities.append(ticket.priority)
            groups.append(ticket.group)
            owners.append(ticket.owner)
        }
        
        priorities = priorities.uniqued()
        groups = groups.uniqued()
        owners = owners.uniqued()
        
        return self
    }
    
    func filterTickets(for tickets: [Ticket], with filter: Filter) -> [Ticket] {
        tickets.filter { ticket in
            priorities.contains(ticket.priority) &&
            groups.contains(ticket.group) &&
            owners.contains(ticket.owner)
        }
    }
}
