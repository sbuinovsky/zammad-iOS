//
//  DashboardElement.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 24.10.2021.
//

import Foundation
import UIKit


struct DashboardItem {
    var icon: DashboardIcon
    var title: String
    var description: String
    var average: String
}


//MARK: - Extension
extension DashboardItem {
    enum DashboardIcon: String {
        case waitingTime = "waiting-time-icon.svg"
        case mood = "mood-icon.svg"
        case assigned = "assigned-icon.svg"
        case ticketsInProgress = "tickets-in-progress-icon.svg"
        case reopeningRate = "reopening-rate.svg"
    }
}
