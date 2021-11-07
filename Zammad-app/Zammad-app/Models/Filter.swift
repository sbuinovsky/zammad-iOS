//
//  Filter.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 07.11.2021.
//

import UIKit

class Filter {
    private var priorities: [Priority] = []
    private var owners: [User] = []
    private var groups: [String] = []
    
    func cleanValues() {
        priorities = []
        owners = []
        groups = []
    }
    
    func getPriorities() -> [Priority] {
        priorities
    }
    
    func getOwners() -> [User] {
        owners
    }
    
    func getGroups() -> [String] {
        groups
    }
    
    func setPriorities(with newValue: [Priority]) {
        priorities = newValue
    }
    
    func getOwners(with newValue: [User]) {
        owners = newValue
    }
    
    func getGroups(with newValue: [String]) {
        groups = newValue
    }
    
    func fillFromTickets(with tickets: [Ticket]) -> Filter {
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
