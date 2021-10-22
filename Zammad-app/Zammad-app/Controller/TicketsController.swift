//
//  TicketsController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import UIKit

// MARK: - Test model

let tickets = [
    Ticket(number: "324", title: "Some title to check the table view and to check long text", status: "None", priority: "None", group: "Web", owner: "J.James"),
    Ticket(number: "325", title: "Some title2", status: "None", priority: "None", group: "Web", owner: "J.James"),
    Ticket(number: "326", title: "Some title3", status: "None", priority: "None", group: "Web", owner: "J.James"),
    Ticket(number: "327", title: "Some title4", status: "None", priority: "None", group: "Web", owner: "J.James"),
    Ticket(number: "328", title: "Some title5", status: "None", priority: "None", group: "Web", owner: "J.James"),
    Ticket(number: "329", title: "Some title6", status: "None", priority: "None", group: "IT", owner: "J.James"),
    Ticket(number: "330", title: "Some title7", status: "None", priority: "None", group: "IT", owner: "J.James"),
    Ticket(number: "331", title: "Some title8", status: "None", priority: "None", group: "IT", owner: "J.James"),
    Ticket(number: "332", title: "Some title9", status: "None", priority: "None", group: "Design", owner: "J.James"),
    Ticket(number: "334", title: "Some title10", status: "None", priority: "None", group: "Design", owner: "J.James"),
    Ticket(number: "335", title: "Some title11", status: "None", priority: "None", group: "Design", owner: "J.James"),
]


class TicketsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: "TicketCell", bundle: nil)
        
        tableView.register(cellNib, forCellReuseIdentifier: "ticketCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketCell
        
        let ticket = tickets[indexPath.row]
        
        cell.configure(with: ticket)
        
        return cell
    }
}
