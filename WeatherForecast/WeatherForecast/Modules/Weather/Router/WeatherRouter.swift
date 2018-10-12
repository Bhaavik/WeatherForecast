//
//  WeatherRouter.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 11/10/18.
//  Copyright © 2018 Bhavik Doshi. All rights reserved.
//

import Foundation
import UIKit

class WeatherRouter:PresenterToRouterProtocol{
  
    /*!
     * @discussion To create the weather module, router object should be initiated first.
      presenor will communicate with view and interactor, interactor will communicate with entity and presenter.
     */
    
    static func createModule() -> WeatherViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = WeatherPresenter()
        let interactor: PresenterToInteractorProtocol = WeatherInteractor()
        let router:PresenterToRouterProtocol =  WeatherRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
