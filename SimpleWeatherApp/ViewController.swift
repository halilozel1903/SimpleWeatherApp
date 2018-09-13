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
    
    let full_URL = "https://api.openweathermap.org/data/2.5/forecast?q=London,us&appid=f9000123106b91b0c1dd930a4c56d867"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func endEditingTextField(_ sender: UITextField) {
        
        let baseURLString = "https://api.openweathermap.org/data/2.5/forecast?q="
        let cityString = "Istanbul"
        let APIKeyString = "&appid=f9000123106b91b0c1dd930a4c56d867"
        
        if let finalURL = URL(string: baseURLString + cityString + APIKeyString){
            
            requestWeatherData(url: finalURL)
        }else{
            print("Malformed URL")
        }
        
    }
    
    func requestWeatherData(url:URL){
        let task = URLSession.shared.dataTask(with: url){
            (data,response,error) in
            
            if let urlResponse = response{
                print(urlResponse)
            }
            
            if let errorResponse = error{
                print(errorResponse)
            }
            
            else if let dataResponse = data{
                print(dataResponse)
            }
        }
        
        task.resume()
    }
    
    
    @IBAction func pressTodayButton(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func pressTomorrowButton(_ sender: UIBarButtonItem) {
        
    }
    
    
}

