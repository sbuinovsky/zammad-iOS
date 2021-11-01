//
//  Priority.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 27.10.2021.
//

import UIKit

enum PriorityState: String {
    case none = "None"
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}


class Priority {
    
    var state: PriorityState
    var isSelected = false
    var icon: UIImage? {
        switch state {
        case .none:
            return isSelected ? UIImage(named: "priority-none-fill.svg") : UIImage(named: "priority-none.svg")
        case .low:
            return isSelected ? UIImage(named: "priority-low-fill.svg") : UIImage(named: "priority-low.svg")
        case .medium:
            return isSelected ? UIImage(named: "priority-medium-fill.svg") : UIImage(named: "priority-medium.svg")
        case .high:
            return isSelected ? UIImage(named: "priority-high-fill.svg") : UIImage(named: "priority-high.svg")
        }
    }
    
    //MARK: - Initialization
    init() {
        state = .none
    }
    
    
    init(state: PriorityState) {
        self.state = state
    }
    
    
    //MARK: - Public methods
    func getPriorityDict() -> [PriorityState: Priority] {
        [.none: Priority(state: .none),
        .low: Priority(state: .low),
        .medium: Priority(state: .medium),
        .high: Priority(state: .high)]
    }
}
