//
//  Data Manager.swift
//  Api Weather Test
//
//  Created by Max Nguyen on 7/21/21.
//

import Foundation

enum DataManagerError: Error {

    case Unknown
    case FailedRequest
    case InvalidResponse

}

final class DataManager{
    typealias WeatherDataCompletion = (AnyObject?, DataManagerError?) -> ()
    let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
        
    }
    
    func weatherDataForLocation(lat: Double, long: Double, completion: WeatherDataCompletion){
        let URL = baseURL.appendingPathComponent("\(lat),\(long)")

            // Create Data Task
            URLSession.shared.dataTask(with: URL) { (data, response, error) in
                self.didFetchWeatherData(data: data, response: response, error: error, completion: completion)
            }.resume()
        

    }
    
    private func didFetchWeatherData(data: Data?, response: URLResponse?, error: Error?, completion: WeatherDataCompletion) {
        if let _ = error {
            completion(nil, .FailedRequest)

        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                processWeatherData(data: data, completion: completion)
            } else {
                completion(nil, .FailedRequest)
            }

        } else {
            completion(nil, .Unknown)
        }
    }
    
    private func processWeatherData(data: Data, completion: WeatherDataCompletion) {
        if let JSON = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject {
            completion(JSON, nil)
        } else {
            completion(nil, .InvalidResponse)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}
