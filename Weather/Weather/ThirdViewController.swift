//
//  ThirdViewController.swift
//  Weather
//
//  Created by akane.ota on 2019/03/06.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ThirdViewController: UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    var itemInfo: IndicatorInfo = "明後日"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather = WeatherData.getWeather()
        let forecasts = WeatherData.getForecasts(weatherNews: weather, num: 2)
        weatherLabel.text = forecasts.telop
        
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
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
