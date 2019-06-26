//
//  WeatherManager.swift
//  weather
//
//  Created by Reginald McDonald on 2019-06-24.
//  Copyright © 2019 Reginald McDonald. All rights reserved.
//

import Foundation

class WeatherManager {
    var city: String?;
    var currentWeather: String?;
    var observers: [Observer] = [];
    
    init () {
        if let city = UserDefaults.standard.object(forKey: "city") as? String {
            self.city = city;
            setCurrentWeather();
        }
        makeCallToGetWeather(city: "San Francisco")
    }
    
    public func setCity(city c: String) {
        city = c;
        UserDefaults.standard.set(c, forKey: "city");
        makeCallToGetWeather(city: c);
    }
    
    private func setCurrentWeather() {
        if let c = self.city {
            makeCallToGetWeather(city: c);
        }
    }
    
    private func makeCallToGetWeather(city: String) {
        var formattedCity = city.split(separator: " ").joined(separator: "-");
//        formattedCity = formattedCity.lowercased();
        if let url = URL(string: "https://www.weather-forecast.com/locations/\(formattedCity)/forecasts/latest") {
            let request = URLRequest(url: url);
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                if error != nil {
                    print (error);
                } else {
                    if let unwrappedData = data {
                        let dataString = String(data: unwrappedData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!;
                        DispatchQueue.main.sync(execute: {
                            self.extractWeather(dataString);
                            self.notify();
                        });
                    }
                }
            }
            task.resume();
        }
    }
    
    private func extractWeather(_ data: String) {
        let startOfPhrase = data.range(of: "\"phrase\">")!;
        var parsedData = data[startOfPhrase.upperBound...];
        let endOfPhrase = parsedData.firstIndex(of: "<")!;
        parsedData = parsedData[parsedData.startIndex...parsedData.index(before: endOfPhrase)];
        self.currentWeather = String(parsedData);
    }
    
    public func getWeather() -> (String?) {
        return currentWeather;
    }
    
    public func attachObserver(observer: Observer) {
        observers.append(observer);
    }
    
    private func notify() {
        for o in observers {
            o.update();
        }
    }
}
