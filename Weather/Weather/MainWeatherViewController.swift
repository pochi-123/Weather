//
//  MainWeatherViewController.swift
//  Weather
//
//  Created by akane.ota on 2019/03/06.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MainWeatherViewController: ButtonBarPagerTabStripViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        //バーの色
        settings.style.buttonBarBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        //ボタンの色
        settings.style.buttonBarItemBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        //セルの文字色
        settings.style.buttonBarItemTitleColor = UIColor.white
        //セレクトバーの色
        settings.style.selectedBarBackgroundColor = UIColor(red: 254/255, green: 0, blue: 124/255, alpha: 1)
        
        
        super.viewDidLoad()
        let weather = WeatherData.getWeather()
        let location = String((weather.location.prefecture) + "(" + weather.location.city + ")")
        self.title = location
        // TODO: 改行が変だったので後でいい感じにしたい
        let text = weather.description.text.replacingOccurrences(of:"\n", with: "")
        descriptionLabel.text = text
    }

    override func viewControllers(for pagerTabStripViewController: PagerTabStripViewController) -> [UIViewController] {
        // 管理されるViewControllerを返す処理
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "First")
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Second")
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Third")
        
        var childViewControllers: [UIViewController] = [firstVC, secondVC, thirdVC]
        let weather = WeatherData.getWeather()
        if childViewControllers.count > weather.forecasts.count {
            childViewControllers.remove(at: weather.forecasts.count)
        }
        
        return childViewControllers
    }
}
