//
//  Observer.swift
//  weather
//
//  Created by Reginald McDonald on 2019-06-24.
//  Copyright © 2019 Reginald McDonald. All rights reserved.
//

import Foundation

protocol Observer {
    var id : Int{ get };
    func update();
}
