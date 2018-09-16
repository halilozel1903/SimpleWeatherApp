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
   
    var weatherDataHandler : WeatherDataHandler!
    var currentDay : Day = .today
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = DateHandler.todaysDate
    }

    
    @IBAction func endEditingTextField(_ sender: UITextField) {
        
        let baseURLString = "https://api.openweathermap.org/data/2.5/forecast?q="
        let APIKeyString = "&appid=f9000123106b91b0c1dd930a4c56d867"
        guard let cityString = sender.text else {return}
        
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
                // print(dataResponse)
                self.weatherDataHandler = WeatherDataHandler(_data: dataResponse)
                self.weatherDataHandler.decodeData()
                
                let delay = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: delay, execute: {
                    self.displayWeatherData()
            })
        }
        }
        task.resume()
    }
    
    func displayWeatherData(){
        guard let weatherDataHandle = weatherDataHandler else { return }
        if let city = weatherDataHandle.cityString{
            
            self.infoLabel.text = city
        }
        
        
        var day : WeatherByDay?
        switch self.currentDay {
        case .today:
            day = weatherDataHandle.todaysData
            dateLabel.text = DateHandler.todaysDate
        case .tomorrow:
            day = weatherDataHandle.tomorrowsData
            dateLabel.text = DateHandler.tomorrowsDate
        }
        
        if let currentDay = day{
            temperatureLabel.text = "\(currentDay.averageTemp)℃"
            minMaxLabel.text = "Min : \(currentDay.averageMinTemp)℃, Max : \(currentDay.averageMaxTemp)℃"
            getWeatherIcon(iconString: currentDay.iconString)
        }else{
            temperatureLabel.text = "No data to display"
            minMaxLabel.text = "No data to display"
        }
        
    }
    
    func getWeatherIcon(iconString: String) {
        let baseURLString = "http://openweathermap.org/img/w/"
        let endURLString = ".png"
        guard let iconURL = URL(string: baseURLString + iconString + endURLString) else { return }
        let task = URLSession.shared.dataTask(with: iconURL) {
            (data,response,error) in
            if let urlResponse = response {
                print(urlResponse)
            }
            if let errorResponse = error {
                print(errorResponse)
            } else if let dataResponse = data {
                let delay = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: delay, execute: {
                    self.displayIconImage(data: dataResponse)
                })
            }
        }
        task.resume()
    }
    
    func displayIconImage(data: Data) {
        if let image = UIImage(data: data) {
            self.weatherImageView.image = image
        } else {
            print("Could not convert image")
        }
    }
    
    
    
    @IBAction func pressTodayButton(_ sender: UIBarButtonItem) {
        currentDay = .today
        displayWeatherData()
    }
    
    
    @IBAction func pressTomorrowButton(_ sender: UIBarButtonItem) {
        currentDay = .tomorrow
        displayWeatherData()
    }
    
    
}

