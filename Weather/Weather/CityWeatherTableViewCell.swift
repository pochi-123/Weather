//
//  CityWeatherTableViewCell.swift
//  Weather
//
//  Created by akane.ota on 2019/03/07.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit

class CityWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    func setCell(indexPath: IndexPath) {
        let weather = WeatherData.getWeather(num: indexPath.row)
        let forecasts = WeatherData.getForecasts(weatherNews: weather, num: 0)

        cityLabel.text = weather.location.city

        if let maxTemp = forecasts.temperature.max?.celsius {
            maxTempLabel.text = maxTemp
        } else {
            maxTempLabel.text = " - "
        }

        if let minTemp = forecasts.temperature.min?.celsius {
            minTempLabel.text = minTemp
        } else {
            minTempLabel.text = " - "
        }

        if let url = URL(string: forecasts.image.url) {
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data!)
            weatherImage.image = image
            weatherImage.contentMode = UIView.ContentMode.scaleAspectFit
        }
    }

}
