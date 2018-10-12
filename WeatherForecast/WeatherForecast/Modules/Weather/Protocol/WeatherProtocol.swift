//
//  WeatherProtocol.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 11/10/18.
//  Copyright © 2018 Bhavik Doshi. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingForecast(_ city:String,zipCode:String)
}

protocol PresenterToViewProtocol: class{
    func showWeather(weather:WeatherModel?)
    func showError(_ errorMessage:String)
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> WeatherViewController
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchForecast(apiParam:String)
}

protocol InteractorToPresenterProtocol: class {
    func weatherFetchedSuccess(weatherModel:WeatherModel)
    func weatherFetchFailed(_ errorMessage:String)
}

