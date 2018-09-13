//
//  ViewController.swift
//  SimpleWeatherApp
//
//  Created by Halil Özel on 12.09.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var minMaxLabel: UILabel!
    
    let API_KEY = "f9000123106b91b0c1dd930a4c56d867"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func endEditingTextField(_ sender: UITextField) {
        
    }
    
    
    @IBAction func pressTodayButton(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func pressTomorrowButton(_ sender: UIBarButtonItem) {
        
    }
    
    
}

