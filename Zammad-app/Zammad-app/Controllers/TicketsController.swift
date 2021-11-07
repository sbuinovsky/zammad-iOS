//
//  TicketsController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import UIKit

protocol TicketsOptionsControllerDelegate: AnyObject {
    
    func updateFilterParams(with newFilter: Filter)
}

class TicketsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var optionsIcon: UIImageView!
    
    //MARK: - Variables
    private var tickets: [Ticket] = []
    private var filteredTickets: [Ticket] = []
    private var filter = Filter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: "TicketCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "ticketCell")
        tableView.estimatedRowHeight = 150
        
        tickets = testTickets
        filteredTickets = tickets
        
        filter = filter.fillFromTickets(with: tickets)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        filteredTickets = filter.filterTickets(for: tickets, with: filter)
    }
    
    //MARK: - TableView configure
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketCell
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        let ticket = filteredTickets[indexPath.row]
        cell.configure(with: ticket)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ticketsOptionsSegue" {
            let destController = segue.destination as! TicketsOptionsController
            destController.filter = filter
            destController.delegate = self
        }
    }
    
    //MARK: - IBActions
    @IBAction func optionsIconTapped(_ sender: Any) {
        performSegue(withIdentifier: "ticketsOptionsSegue", sender: UITapGestureRecognizer.self)

    }
}


//MARK: - Extension
extension TicketsController: TicketsOptionsControllerDelegate {
    
    //MARK: - Public methods
    func updateFilterParams(with newFilter: Filter) {
        filter = newFilter
        filteredTickets = filter.filterTickets(for: tickets, with: filter)
        filteredTickets.forEach { $0.priority.isSelected = true }
        tableView.reloadData()
    }
}


