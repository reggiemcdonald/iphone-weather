//
//  WeatherViewController.swift
//  weather
//
//  Created by Reginald McDonald on 2019-06-24.
//  Copyright © 2019 Reginald McDonald. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var cityName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Code goes here
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityName.resignFirstResponder();
        return true;
    }
    
    
}
