//
//  Weather.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 11/10/18.
//  Copyright © 2018 Bhavik Doshi. All rights reserved.
//

import Foundation
import UIKit


class WeatherModel {
    var list = [List]()
    init(withDictionary dictionary:[String:Any]) {
        for item in (dictionary["list"] as? [[String:Any]])!{
            list.append(List.init(withDictionary: item))
        }
    }
}

class List {
    
    var grouping = [String:[Weather]]()
    var weatherList = [Weather]()
    var dateList = [String]()
    let defaultFormatter  = DateFormatter()
    
    init(withDictionary dictionary:[String:Any]) {
        defaultFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = defaultFormatter.date(from: (dictionary["dt_txt"]as! String))
        defaultFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = defaultFormatter.string(from: date!)
        
        dateList.append(defaultFormatter.string(from: date!))
        for item in (dictionary["weather"] as? [[String:Any]])!{
            weatherList.append(Weather.init(withDictionary: item,andDate: strDate,fullDate:(dictionary["dt_txt"]as! String) ))
    }
        

  }
    
  
}

class Weather {
    
    let id: Int
    let main: String?
    let description: String?
    let icon: String?
    let date: String?
    let fullDate: String?
    init(withDictionary dictionary:[String:Any],andDate groupingDate:String,fullDate:String) {
        id = dictionary ["id"] as! Int
        main = dictionary ["main"]as? String ?? " "
        description = dictionary ["description"]as? String ?? " "
        icon = dictionary ["icon"]as? String ?? " "
        date = groupingDate
        self.fullDate = fullDate
    }
}

