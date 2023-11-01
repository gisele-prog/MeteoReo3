//
//  NetworkLayer.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//




import Foundation

class OpenweatherAPIClient {
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    typealias ForecastWeatherCompletionHandler = (ForecastWeatherResponse?, Error?) -> Void

 let apiKey = "c52660bf07bcc2ccc390fb5ba55d279e"
 let decoder = JSONDecoder()
 var session: URLSession

    enum SuffixURL: String {
        case forecastWeather = "forecast"
        case currentWeather = "weather"
    }
                          
 func baseUrl(_ suffixURL: SuffixURL, param: String) -> URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/\(suffixURL.rawValue)?APPID=\(self.apiKey)&units=imperial\(param)")!
    }
        
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
        
    private func getBaseRequest<T: Codable>(at cityId: String,
                                            suffixURL: SuffixURL,
                                            completionHandler completion:  @escaping (_ object: T?,_ error: Error?) -> ()) {
        
        let url = baseUrl(suffixURL, param: "&id=\(cityId)")
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, ResponseError.requestFailed)
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        do {
                            let weather = try self.decoder.decode(T.self, from: data)
                            completion(weather, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, ResponseError.invalidData)
                    }
                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
    
    func getCurrentWeather(at cityId: String, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getBaseRequest(at: cityId, suffixURL: .currentWeather) { (weather: CurrentWeather?, error) in
            completion(weather, error)
        }
    }
    
    func getForecastWeather(at cityId: String, completionHandler completion: @escaping ForecastWeatherCompletionHandler) {
        getBaseRequest(at: cityId, suffixURL: .forecastWeather) { (weather: ForecastWeatherResponse?, error) in
            completion(weather, error)
        }
    }
}
