//
//  TicketsController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import UIKit

class TicketsController: UIViewController,
                         UITableViewDelegate,
                         UITableViewDataSource {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var optionsIcon: UIImageView!
    
    //MARK: - Variables
    private var tickets: [Ticket] = []
    private var filteredTickets: [Ticket] = []
    private var currentFilters: ([Priority], [String], [User])!
    private let filterService: FilterServiceProtocol = FilterService()
    private let ticketService: TicketServiceProtocol = TicketService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: "TicketCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "ticketCell")
        
        tableView.estimatedRowHeight = 150
        
        tickets = testTickets
        filteredTickets = tickets
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        currentFilters = ticketService.getFilterParametes(for: tickets)
        filteredTickets = filterService.filterTickets(for: tickets, with: currentFilters)
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
            destController.filterParams = currentFilters
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
    func updateFilterParams(with params: ([Priority], [String], [User])) {
        currentFilters = params
        filteredTickets = filterService.filterTickets(for: tickets, with: currentFilters)
        tableView.reloadData()
    }
    
  
}


