//
//  Helper.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 12/10/18.
//  Copyright © 2018 Bhavik. All rights reserved.
//

import Foundation

class Helper {
    
      let dateFormatter = DateFormatter()
      static let sharedHelper = Helper()
       private init() {
        
     }
    
    
    func convertDate(with fromDateFormatter:DateFormatType = .date, toDateFormatter:DateFormatType = .localDateFull, dateString: String) -> String {
        dateFormatter.dateFormat = fromDateFormatter.rawValue
        let date = dateFormatter.date(from: dateString)!
         dateFormatter.dateFormat = toDateFormatter.rawValue
        return dateFormatter.string(from: date)
    }
    
    
   
}

enum DateFormatType: String {
    /// Time
    case time = "HH:mm:ss"
    
    /// Date with hours
    case dateWithTime = "yyyy-MM-dd HH:mm:ss"
    
    /// Date
    case date = "yyyy-MM-dd"
    case localDateFull = "EEEE - MMMM dd, y"
     case localTime = "h:mm a"
}

