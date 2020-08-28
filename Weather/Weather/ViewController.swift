//
//  ViewController.swift
//  Weather
//
//  Created by akane.ota on 2019/03/06.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectRow = weatherTableView.indexPathForSelectedRow {
            weatherTableView.deselectRow(at: selectRow, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeatherData.cityId.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! CityWeatherTableViewCell
        cell.setCell(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = WeatherData.getWeather(num: indexPath.row)
        performSegue(withIdentifier: "segueWeather2", sender: nil)
    }
}

