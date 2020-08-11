//
//  WeatherManager.swift
//  Clima
//
//  Created by Angela Yu on 03/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

// initialises a protocol called weather delegate, anything that uses this protocal must have a didUpdateWeather and didFailWithError method
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


// our weather manager struct
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e72ca729af228beabd5d20e3b7749713&units=metric"
    
    // assigns it a delegate value, optionally of the weatherManagerDelegate
    var delegate: WeatherManagerDelegate?
    
    
    // the fetch method using the search bar
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        // we make a string out of the URL and then call the performRequest method
        performRequest(with: urlString)
    }
    
    // the fetch method that uses the core location data granted from .plist
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    
    // called by the fetchWeather methods above, passed the urlString that they create
    func performRequest(with urlString: String) {
        
        // if let is OPTIONAL BINDING, the functionality is ignored if the urlString is nil
        if let url = URL(string: urlString) {
            // we create a URL Session
            let session = URLSession(configuration: .default)
            
            //we then create a dataTask
            let task = session.dataTask(with: url) { (data, response, error) in
                // checks for errors in the data task
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                // OPTIONAL BIDING, if the data is not nil, then we call the parseJSON method defined below
                if let safeData = data {
                    
                    // weather is the safe data weather model returned from the parseJSON method below. We then use it to call the didUpdateWeather function which will async update in the WeatherViewController file. 
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    // this functions takes the safe data from the function call above and will return a weatherModel
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}


