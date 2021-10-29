//
//  Priority.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 27.10.2021.
//

import UIKit

class Priority {
    
    var state: PriorityState
    var isSelected: Bool
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
    
    
    init(_ state: PriorityState) {
        self.state = state
        self.isSelected = false
    }
}
