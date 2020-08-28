//
//  SetDataViewController.swift
//  Weather
//
//  Created by akane.ota on 2019/03/07.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit
import SVProgressHUD

class SetDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // グルグル
        SVProgressHUD.show()
        
        let semaphore = DispatchSemaphore(value: 0)
        
        // サブスレッドで処理↓
        DispatchQueue.global(qos: .default).async {
            for cityIdText in WeatherData.cityId {
                WeatherData.load(cityId: cityIdText)
                // forの最後にwaitを解除
            }
            semaphore.signal()
        }
        // サブスレッドで処理↑
        
        // wait
        semaphore.wait()
        // グルグル非表示
        SVProgressHUD.dismiss()
    }
}
