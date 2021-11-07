//
//  DashboardElement.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 24.10.2021.
//

import UIKit

struct DashboardItem {
    enum DashboardIcon: String {
        case waitingTime = "waiting-time-icon.svg"
        case mood = "mood-icon.svg"
        case assigned = "assigned-icon.svg"
        case ticketsInProgress = "tickets-in-progress-icon.svg"
        case reopeningRate = "reopening-rate.svg"
    }
    
    var icon: DashboardIcon
    var title: String
    var description: String
    var average: String
}
