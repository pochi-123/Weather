//
//  WeatherData.swift
//  Weather
//
//  Created by akane.ota on 2019/03/06.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import Foundation
import Alamofire

class WeatherData {
    static var weatherInfo: WeatherInformation = WeatherInformation()
    static let weatherUrl = "http://weather.livedoor.com/forecast/webservice/json/v1?city="
    static let weatherCityId = "015010"
    static var selectWeatherNews: WeatherNews?

    
    
    static func load(cityId: String){
        Alamofire.request(weatherUrl + cityId).responseJSON {response in
            if let data = response.data {
                let weatherNews = try? JSONDecoder().decode(WeatherNews.self, from: data)
                self.weatherInfo.weatherNews.append(weatherNews!)
            }
        }
    }
    
    static func getWeather(num: Int) -> WeatherNews{
        self.selectWeatherNews = weatherInfo.weatherNews[num]
        return weatherInfo.weatherNews[num]
    }
    
    static func getWeather() -> WeatherNews {
        return self.selectWeatherNews!
    }
    
    static func getForecasts(weatherNews: WeatherNews, num: Int) -> Forecast {
        let forecasts = weatherNews.forecasts[num]
        return forecasts
    }
    
    struct WeatherInformation: Codable {
        var weatherNews: Array<WeatherNews> = []
    }
    
    struct WeatherNews: Codable {
        let title: String
        let publicTime: String
        let forecasts: [Forecast]
        let location: WeatherLocation
        let description: WeatherDescription
    }
    
    struct Forecast: Codable {
        let dateLabel: String
        let telop: String
        let date: String
        let temperature: TemperatureCollection
        let image: WeatherImage
    }
    
    struct TemperatureCollection: Codable {
        let min: Temperature?
        let max: Temperature?
    }
    
    struct Temperature: Codable {
        let celsius: String
        let fahrenheit: String
    }
    
    struct WeatherImage: Codable {
        let width: Int
        let height: Int
        let title: String
        let url: String
    }
    
    struct WeatherLocation: Codable {
        let city: String
        let area: String
        let prefecture: String
    }
    
    struct WeatherDescription: Codable {
        let text: String
        let publicTime: String
    }
    
    static let cityId = [
        "250010",
        "250020",
        "260010",
        "260020",
        "270000",
        "280010",
        "280020",
        "290010",
        "290020",
        "300010",
        "300020"
    ]
}



