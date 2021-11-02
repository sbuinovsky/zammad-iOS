//
//  TicketsOptionsViewController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 27.10.2021.
//

import UIKit

protocol TicketsOptionsControllerDelegate: AnyObject {
    
    func updateFilterParams(with params: ([Priority], [String], [User]))
}


class TicketsOptionsController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var closeIcon: UIImageView!
    @IBOutlet weak var priorityHighIcon: UIImageView!
    @IBOutlet weak var priorityMediumIcon: UIImageView!
    @IBOutlet weak var priorityLowIcon: UIImageView!
    @IBOutlet weak var priorityNoneIcon: UIImageView!
    
    //MARK: - Variables
    weak var delegate: TicketsOptionsControllerDelegate?
    var filterParams: ([Priority], [String], [User])!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setState(for: filterParams)
    }
    
    //MARK: - IBActions
    @IBAction func closeIconPressed(_ sender: UITapGestureRecognizer) {
        
        filterParams = prepareFilterParams(for: filterParams)
        
        delegate?.updateFilterParams(with: filterParams)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func priorityHighIconTapped(_ sender: Any) {
        switchPriorityIcon(for: .high)
    }
    
    @IBAction func priorityMediumIconTapped(_ sender: Any) {
        switchPriorityIcon(for: .medium)
    }
    
    @IBAction func priorityLowIconTapped(_ sender: Any) {
        switchPriorityIcon(for: .low)
    }
    
    @IBAction func priorityNoneIconTapped(_ sender: Any) {
        switchPriorityIcon(for: .none)
    }
}


// MARK: - Extension
extension TicketsOptionsController {
    
    //MARK: - Private methods
    private func setState(for params: ([Priority], [String], [User])) {
        
        for item in params.0 {
            item.isSelected = true
            setPriorityIcon(for: item)
        }
    }
    
    private func setPriorityIcon(for priority: Priority) {
        let priorityItem = priority
        
        switch priorityItem.state {
        case .none:
            priorityNoneIcon.image = priorityItem.icon
        case .low:
            priorityLowIcon.image = priorityItem.icon
        case .medium:
            priorityMediumIcon.image = priorityItem.icon
        case .high:
            priorityHighIcon.image = priorityItem.icon
        }
    }
    
    private func switchPriorityIcon(for state: PriorityState) {
        
        let priority = Priority(state: state)
        
        if filterParams.0.contains(priority) {
            for item in filterParams.0 {
                if item.state == state {
                    item.isSelected = item.isSelected ? false : true
                    setPriorityIcon(for: item)
                }
            }
        } else {
            filterParams.0.append(priority)
        }
        
        
    }
    
    private func prepareFilterParams(for params: ([Priority], [String], [User]))
                                            -> ([Priority], [String], [User]) {
        var parameters = params
        
        parameters.0 = params.0.filter { $0.isSelected == true }
        parameters.0.forEach { $0.isSelected = false }
        
        return parameters
    }
    
    
}
