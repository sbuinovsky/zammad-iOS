//
//  TicketService.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 02.11.2021.
//

import Foundation

protocol TicketServiceProtocol {
    
    func getFilterParametes(for tickets: [Ticket]) -> ([Priority], [String], [User])
}


class TicketService: TicketServiceProtocol {
    
    func getFilterParametes(for tickets: [Ticket]) -> ([Priority], [String], [User]) {
        
        var priorities: [Priority] = []
        var groups: [String] = []
        var owners: [User] = []
        
        for ticket in tickets {
            priorities.append(ticket.priority)
            groups.append(ticket.group)
            owners.append(ticket.owner)
        }
        
        return (priorities.uniqued(), groups.uniqued(), owners.uniqued())
    }
    
}
