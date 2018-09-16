//
//  WeatherDataHandler.swift
//  SimpleWeatherApp
//
//  Created by Halil Özel on 13.09.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Foundation

class WeatherDataHandler  {
    
    let data : Data
    var weatherJSONData : WeatherData?
    var cityString : String?
    var todaysData : WeatherByDay?
    var tomorrowsData : WeatherByDay?
    
    init(_data : Data) {
        self.data = _data
    }
    
    func decodeData(){
        
        let decoder = JSONDecoder()
        do {
           weatherJSONData = try decoder.decode(WeatherData.self, from: self.data)
            
            if let weatherData = weatherJSONData{
                cityString = weatherData.city.name + "," + weatherData.city.country
            }
            
        } catch  {
            print(error)
        }
    }
}
