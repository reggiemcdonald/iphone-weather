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
    @IBOutlet weak var weatherMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        weatherManager = WeatherManager();
        weatherManager.attachObserver(observer: self);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // DO stuff
        
    }
    
    public func update(weather: String) {
        weatherMessage.text = weather;
    }
    
    func update() {
        weatherMessage.text = weatherManager.getWeather() ?? "Invalid City";
    }
    



}

