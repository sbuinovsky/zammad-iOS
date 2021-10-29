//
//  TicketsOptionsViewController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 27.10.2021.
//

import UIKit

protocol TicketsOptionsControllerDelegate: AnyObject {
    func updateFilterParams(with params: [PriorityState])
}


class TicketsOptionsController: UIViewController {

    @IBOutlet weak var closeIcon: UIImageView!
    @IBOutlet weak var priorityHighIcon: UIImageView!
    @IBOutlet weak var priorityMediumIcon: UIImageView!
    @IBOutlet weak var priorityLowIcon: UIImageView!
    @IBOutlet weak var priorityNoneIcon: UIImageView!
    
    private var priorityDict: [PriorityState: Priority] = [
        .none: Priority(.none),
        .low: Priority(.low),
        .medium: Priority(.medium),
        .high: Priority(.high)
    ]
    
    weak var delegate: TicketsOptionsControllerDelegate?
    
    var filterParams: [PriorityState]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setState(for: filterParams)
    }
    
    @IBAction func closeIconPressed(_ sender: UITapGestureRecognizer) {
        var newFilters: [PriorityState] = []
        for (key, value) in priorityDict {
            if value.isSelected {
                newFilters.append(key)
            }
        }
        delegate?.updateFilterParams(with: newFilters)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func priorityHighIconTapped(_ sender: Any) {
        setPriorityIcon(for: .high)
    }
    
    
    @IBAction func priorityMediumIconTapped(_ sender: Any) {
        setPriorityIcon(for: .medium)
    }
    
    
    @IBAction func priorityLowIconTapped(_ sender: Any) {
        setPriorityIcon(for: .low)
    }
    
    
    @IBAction func priorityNoneIconTapped(_ sender: Any) {
        setPriorityIcon(for: .none)
    }
    
}


// MARK: - Extension
extension TicketsOptionsController {
    
    
    private func setState(for params: [PriorityState]) {
        
        for item in params {
            setPriorityIcon(for: item)
        }
        
    }
    
    
    private func setPriorityIcon(for state: PriorityState) {
        guard let priorityItem = priorityDict[state] else {return}

        priorityItem.isSelected = priorityItem.isSelected ? false : true
        
        switch state {
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
    
}
