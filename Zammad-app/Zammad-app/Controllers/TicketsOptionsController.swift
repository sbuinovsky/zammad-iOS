//
//  TicketsOptionsViewController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 27.10.2021.
//

import UIKit

class TicketsOptionsController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var closeIcon: UIImageView!
    @IBOutlet weak var priorityHighIcon: UIImageView!
    @IBOutlet weak var priorityMediumIcon: UIImageView!
    @IBOutlet weak var priorityLowIcon: UIImageView!
    @IBOutlet weak var priorityNoneIcon: UIImageView!
    @IBOutlet weak var groupsLabel: UILabel!
    
    //MARK: - Variables
    weak var delegate: TicketsOptionsControllerDelegate?
    var filter: Filter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setPriorityState(for: filter)
        setGroupsLabelState(for: filter)
    }
    
    //MARK: - IBActions
    @IBAction func closeIconPressed(_ sender: UITapGestureRecognizer) {
        
        filter = prepareFilterParams(for: filter)
    
        delegate?.updateFilterParams(with: filter)
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
    private func setPriorityState(for filter: Filter) {
        filter.priorities.forEach {
            setPriorityIcon(for: $0)
        }
    }
    
    private func setGroupsLabelState(for filter: Filter) {
        let summaryString = filter.groups.reduce("", {
            $0 == "" ? $1 : $0 + ",  " + $1
        })
        
        groupsLabel.text = summaryString
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
        
        if filter.priorities.contains(priority) {
            for item in filter.priorities {
                if item.state == state {
                    item.isSelected = item.isSelected ? false : true
                    setPriorityIcon(for: item)
                }
            }
        } else {
            filter.priorities.append(priority)
            setPriorityIcon(for: priority)
        }
    }
    
    private func prepareFilterParams(for filter: Filter) -> Filter {
        
        filter.priorities = filter.priorities.filter { $0.isSelected == true }
        filter.priorities.forEach { $0.isSelected = true }
        
        return filter
    }
    
    
}
