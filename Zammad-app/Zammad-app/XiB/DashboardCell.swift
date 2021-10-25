//
//  DashboardCell.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 25.10.2021.
//

import UIKit

class DashboardCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    
    func configure(with item: DashboardItem) {
        iconImage.image = UIImage(named: item.icon.rawValue)
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        averageLabel.text = item.average
    }
}
