//
//  ViewController.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 20.10.2021.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityIndicator.startAnimating()
    }

}

