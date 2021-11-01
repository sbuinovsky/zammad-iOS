//
//  TestData.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 24.10.2021.
//

import Foundation

// MARK: - Users

let testUser1 = User(id: 1,
                     firstName: "John",
                     lastName: "James",
                     email: "james@test.com",
                     organization: "Web",
                     isVIP: false)

let testUser2 = User(id: 2,
                     firstName: "Andy",
                     lastName: "Garsia",
                     email: "garsia@test.com",
                     organization: "IT",
                     isVIP: false)

let testUser3 = User(id: 3,
                     firstName: "Margo",
                     lastName: "Rollins",
                     email: "rollins@test.com",
                     organization: "Design",
                     isVIP: false)

let testUser4 = User(id: 4,
                     firstName: "Sandy",
                     lastName: "Black",
                     email: "black@test.com",
                     organization: "Web",
                     isVIP: false)

let testUser5 = User(id: 5,
                     firstName: "Andrew",
                     lastName: "Blacky",
                     email: "blacky@test.com",
                     organization: "IT",
                     isVIP: false)

let testUser6 = User(id: 6,
                     firstName: "Aron",
                     lastName: "Federiky",
                     email: "federiky@test.com",
                     organization: "Design",
                     isVIP: false)

let testUser7 = User(id: 7,
                     firstName: "Joshua",
                     lastName: "Armvanhorstenblum",
                     email: "armvanhorstenblum@test.com",
                     organization: "Web",
                     isVIP: false)


// MARK: - Tickets
let testTickets = [
    Ticket(id: 324,
           title: "Some title to check the table view and to check long text",
           status: .new,
           priority: Priority(state: .high),
           customer: testUser7,
           owner: testUser1),
    Ticket(id: 325,
           title: "Some title2",
           status: .none,
           priority: Priority(state: .high),
           customer: testUser6,
           owner: testUser2),
    Ticket(id: 326,
           title: "Some title3",
           status: .open,
           priority: Priority(state: .medium),
           customer: testUser5,
           owner: testUser3),
    Ticket(id: 327,
           title: "Some title4",
           status: .closed,
           priority: Priority(state: .low),
           customer: testUser4,
           owner: testUser4),
    Ticket(id: 328,
           title: "Some title5",
           status: .open,
           priority: Priority(state: .medium),
           customer: testUser3,
           owner: testUser5),
    Ticket(id: 329,
           title: "Some title6",
           status: .new,
           priority: Priority(state: .high),
           customer: testUser2,
           owner: testUser6),
    Ticket(id: 330,
           title: "Some title7",
           status: .new,
           priority: Priority(state: .low),
           customer: testUser1,
           owner: testUser7),
    Ticket(id: 331,
           title: "Some title8",
           status: .new,
           priority: Priority(state: .none),
           customer: testUser2,
           owner: testUser6),
    Ticket(id: 332,
           title: "Some title9",
           status: .new,
           priority: Priority(state: .low),
           customer: testUser3,
           owner: testUser5),
    Ticket(id: 334,
           title: "Some title10",
           status: .open,
           priority: Priority(state: .medium),
           customer: testUser4,
           owner: testUser6),
    Ticket(id: 335,
           title: "Some title11",
           status: .open,
           priority: Priority(state: .high),
           customer: testUser5,
           owner: testUser3)
]


// MARK: - Dashboard items

let testDashboardItems = [
    DashboardItem(icon: .waitingTime,
                  title: "Waiting time today",
                  description: "My handling time: 0 minutes",
                  average: "Average: 0 minutes"),
    DashboardItem(icon: .mood,
                  title: "Mood",
                  description: "0 of my tickets escalated.",
                  average: "Total: 0"),
    DashboardItem(icon: .assigned,
                  title: "Assigned",
                  description: "Tickets assigned to me: 0 of 4",
                  average: "Average: 0.2"),
    DashboardItem(icon: .ticketsInProgress,
                  title: "Tickets in progress",
                  description: "0% are currently in process",
                  average: "Average: 15.7%"),
    DashboardItem(icon: .reopeningRate,
                  title: "Reopening rate",
                  description: "0% are currently in process",
                  average: "Average: 15.7%"),
]
