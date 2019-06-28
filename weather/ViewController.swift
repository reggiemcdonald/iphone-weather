//
//  ViewController.swift
//  weather
//
//  Created by Reginald McDonald on 2019-06-24.
//  Copyright © 2019 Reginald McDonald. All rights reserved.
//

import UIKit


class ViewController: UIViewController, Observer {
    var id: Int = 1;
    
    @IBOutlet weak var backgroundImg: UIImageView!
    var weatherManager: WeatherManager!;
    var city: String?;
    @IBOutlet weak var weatherMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        weatherManager = WeatherManager();
        weatherManager.attachObserver(observer: self);
        if let currentCity = weatherManager.getCity() {
            city = currentCity;
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Here");
        weatherManager.updateThis();
        print("done");
        
    }
    
    func update() {
        weatherMessage.text = weatherManager.getWeather() ?? "Invalid City";
    }
    



}

