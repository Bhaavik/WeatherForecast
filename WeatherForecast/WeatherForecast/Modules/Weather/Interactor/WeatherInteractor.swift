//
//  WeatherInteractor.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 11/10/18.
//  Copyright © 2018 Bhavik Doshi. All rights reserved.
//

import Foundation
import Alamofire

class WeatherInteractor: PresenterToInteractorProtocol{
    
    var presenter: InteractorToPresenterProtocol?
    /*!
     * @discussion function will call api to fetch the forecast info and
     then will call back to presentor.
     * @param apiParam the value of query paramter
     */
    
    func fetchForecast(apiParam:String) {
        if !Connectivity.isConnectedToInternet {
            self.presenter?.weatherFetchFailed("Please enable your internet connection")
            return
        }
        let parameter = ["appid":Constant.appId,"q":apiParam] as [String : Any]
        guard let url = URL(string: Constant.apiPath) else{
            return
        }
        Alamofire.request(url, method: .get, parameters: parameter,
                          encoding: URLEncoding.queryString, headers: nil).responseJSON
            { (response) in
                switch response.result {
                case .success(let json):
                    let response = json as? [String:Any]
                    let object = WeatherModel.init(withDictionary: response!)
                    self.presenter?.weatherFetchedSuccess(weatherModel: object)
                case .failure(let error):
                    print(error)
                    self.presenter?.weatherFetchFailed("Problem Fetching Weather")
                    break
                }
        }
    }
}

