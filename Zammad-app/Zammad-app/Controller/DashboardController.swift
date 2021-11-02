//
//  DashboardController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 22.10.2021.
//

import UIKit

class DashboardController: UIViewController,
                           UITableViewDelegate,
                           UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var dashboardItems: [DashboardItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: "DashboardCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "dashboardCell")
        
        dashboardItems = testDashboardItems
    }
    
    //MARK: - TableView configure
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dashboardItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashboardCell", for: indexPath) as! DashboardCell
        
        cell.configure(with: dashboardItems[indexPath.row])
        
        return cell
    }
    
}
