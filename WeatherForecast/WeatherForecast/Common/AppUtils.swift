//
//  AppUtils.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 11/10/18.
//  Cop

import Foundation
import UIKit
import Alamofire

///To check the internet connectivity
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

/* Show Progress Indicator */
func showProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = false
    
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: "Please wait..")
    progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
    
}

/* Hide progress Indicator */
func hideProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
    
}



