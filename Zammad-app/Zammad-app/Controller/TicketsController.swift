//
//  TicketsController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import UIKit


class TicketsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var optionsIcon: UIImageView!
    
    //MARK: - Variables
    private var tickets: [Ticket] = []
    private var filteredTickets: [Ticket] = []
    private var filterParams: [PriorityState] = []
    private let filterService: FilterServiceProtocol = FilterService()
    
    
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
        
        if !filterParams.isEmpty {
            filteredTickets = filterService.filterTickets(for: tickets, with: filterParams)
        }
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
            destController.filterParams = filterParams
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
    func updateFilterParams(with params: [PriorityState]) {
        self.filterParams = params
        if filterParams.isEmpty {
            filteredTickets = tickets
        } else {
            self.filteredTickets = filterService.filterTickets(for: tickets, with: filterParams)
        }
        
        self.tableView.reloadData()
    }
    
  
}


