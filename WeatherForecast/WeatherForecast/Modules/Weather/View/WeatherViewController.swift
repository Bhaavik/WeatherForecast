//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 11/10/18.
//  Copyright © 2018 Bhavik Doshi. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    
      var groupArray = [[Weather]]()
    
    ///To interact with presentor
    var presentor:ViewToPresenterProtocol?
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var cityTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*!
     * @discussion On tap of Search button the method will be called.
        calling function on presentor to fetch forecase info.
     * @param sender - UIButton instance
     */

    @IBAction func searchTapped(_ sender: Any) {
        showProgressIndicator(view: self.view)
        presentor?.startFetchingForecast(cityTextfield.text!,
                                    zipCode:zipTextField.text!)
    }
}


/*!
 * @discussion Presenter will call back following methods in case of success showWeather will be called and in case of failure showErro will be called
 */
extension WeatherViewController:PresenterToViewProtocol{
 
    
    func showWeather(weather: WeatherModel?) {
        hideProgressIndicator(view: self.view)
        
        guard let arrWeather = weather?.list.flatMap({$0.weatherList}) else {
            return
        }
        
        //Group the filter data according to array
        let grouping = Dictionary(grouping: arrWeather.sorted(by:{$0.date! < $1.date! }))
        { $0.date! }
        // Sort the keys and append the value to the array
        for (_, value) in grouping.sorted(by: { $0.0 < $1.0 }) {
            groupArray.append(value)
        }
        self.weatherTable.reloadData()
    }
    
    func showError(_ errorMessage: String) {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


extension WeatherViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupArray[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date =  groupArray[section][0].date!
        return  Helper.sharedHelper.convertDate(dateString: date)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
        let objWeatherInfo =  groupArray[indexPath.section][indexPath.row]
        cell.weatherLabel.text = objWeatherInfo.description
        cell.dayLabel.text =  Helper.sharedHelper.convertDate(with:.dateWithTime,toDateFormatter: .localTime, dateString: objWeatherInfo.fullDate!)
            return cell
        }
    }


