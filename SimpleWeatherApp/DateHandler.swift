//
//  DateHandler.swift
//  SimpleWeatherApp
//
//  Created by Halil Özel on 16.09.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Foundation

// Tarih ile ilgili olayların ele alındığı sınıftır.

class DateHandler{
    
    static let stringOffset : Int = 10 // sınır değer belirlendi.
    static var todaysDate : String{ // today değeriyle ilgili işlemler
        return formatDateString(date : Date())
    }
    
    static var tomorrowsDate : String{ // tomorrow değeri ile ilgili işlemler
        guard let tomorrowDate = Calendar.current.date(byAdding : .day,
                                                       value : 1, to : Date()) else {return ""}
        return formatDateString(date: tomorrowDate)
    }
    
    // tarihi formatladığımız alan.
    private static func formatDateString(date: Date) -> String{
        let dateString = String(describing: date)
        let endIndex = dateString.index(dateString.startIndex,offsetBy:self.stringOffset)
        return dateString.substring(to: endIndex)
    }
}
