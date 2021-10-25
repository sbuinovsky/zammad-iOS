//
//  DashboardElement.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 24.10.2021.
//

import Foundation
import UIKit

class DashboardItem {
    var icon: DashboardIcon
    var title: String
    var description: String
    var average: String
    
    init(icon: DashboardIcon, title: String, description: String, average: String) {
        self.icon = icon
        self.title = title
        self.description = description
        self.average = average
    }
}
