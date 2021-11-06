//
//  TicketCell.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import UIKit

class TicketCell: UITableViewCell {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var ticketTitle: UILabel!
    @IBOutlet weak var ticketNumber: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var dateChangedLabel: UILabel!
    
    func configure(with ticket: Ticket) {
        statusImage.image = ticket.priority.icon
        ticketTitle.text = ticket.title
        ticketNumber.text = "# \(ticket.id)"
        groupLabel.text = "Group: \(ticket.group)"
        ownerLabel.text = "Owner: \(ticket.ownerName)"
        dateCreatedLabel.text = "Created: "
        dateChangedLabel.text = "Changed: "
    }
}
