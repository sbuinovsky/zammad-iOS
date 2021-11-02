//
//  FilterService.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 27.10.2021.
//

import Foundation

protocol FilterServiceProtocol {
    
    func filterTickets(for tickets: [Ticket],
                       with parameters: ([Priority], [String], [User])) -> [Ticket]
    
}


class FilterService: FilterServiceProtocol {
    
    func filterTickets(for tickets: [Ticket],
                       with parameters: ([Priority], [String], [User])) -> [Ticket] {
       
        tickets.filter { ticket in
            parameters.0.contains(ticket.priority) &&
            parameters.1.contains(ticket.group) &&
            parameters.2.contains(ticket.owner)
        }
    }
    
}
