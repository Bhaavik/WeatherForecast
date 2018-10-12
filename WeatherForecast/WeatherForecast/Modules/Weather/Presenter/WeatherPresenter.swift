//
//  WeatherPresenter.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 11/10/18.
//  Copyright © 2018 Bhavik Doshi. All rights reserved.
//

import Foundation
import UIKit

class WeatherPresenter:ViewToPresenterProtocol {

    ///to communicate from presenter to view
    var view: PresenterToViewProtocol?
    ///to communicate beetween presenter to interactor
    var interactor: PresenterToInteractorProtocol?
    ///to communicate beetween presenter to router, all redirection for weathere module should happen by this clas only
    var router: PresenterToRouterProtocol?

    /*!
     * @discussion function on presentor to fetch forecast info.
      Paramters will be validated and then will be send to interactor
     for api call. on validation fail calling showerror function on view.
     * @param city the value of city textfield
     * @param zipCode the value of zipCode textfield
     */
    
    func startFetchingForecast(_ city:String,zipCode:String) {
        if(city.count == 0 && zipCode.count == 0) {
            view?.showError("Please enter city or zipcode")
            return
        }
        if city.count > 0 {
            interactor?.fetchForecast(apiParam:city)
            return
        }
         interactor?.fetchForecast(apiParam:zipCode)
    }

}

/*!
 * @discussion To communicate  presenter to view.
   bases on api success failure relevant function
   of view will be called
 */
extension WeatherPresenter: InteractorToPresenterProtocol{
  
    func weatherFetchedSuccess(weatherModel: WeatherModel) {
        view?.showWeather(weather: weatherModel)
    }
    
    func weatherFetchFailed(_ errorMessage:String) {
        view?.showError(errorMessage)
    }
}
