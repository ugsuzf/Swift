//
//  ExchangeRates.swift
//  Currency Converter
//
//  Created by Furkan Kaan Ugsuz on 16/09/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import Foundation

struct ExchangeRates : Codable {
    let conversion_rates : [String: Double]
}
