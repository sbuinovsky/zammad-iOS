//
//  FilterService.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 27.10.2021.
//

import Foundation

protocol FilterServiceProtocol {
    
    func filterTickets(for tickets: [Ticket],
                       with parameters: [PriorityState]) -> [Ticket]
    
}


class FilterService: FilterServiceProtocol {
    
    
    func filterTickets(for tickets: [Ticket],
                       with parameters: [PriorityState]) -> [Ticket] {
       
        tickets.filter { parameters.contains($0.priority.state) }
    }
    
}
