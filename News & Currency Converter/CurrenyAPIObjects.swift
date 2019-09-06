//
//  NewsJsonFile.swift
//  News & Currency Converter
//
//  Created by cysparrow on 8/3/19.
//  Copyright © 2019 SweetestProductionsLLC. All rights reserved.
//

import Foundation

/*
 
 JSON - latest.json
 {
 disclaimer: "https://openexchangerates.org/terms/",
 license: "https://openexchangerates.org/license/",
 timestamp: 1449877801,
 base: "USD",
 
 rates:
 {
 AED: 3.672538,
 AFN: 66.809999,
 ALL: 125.716501,
 AMD: 484.902502,
 ANG: 1.788575,
 AOA: 135.295998,
 ARS: 9.750101,
 AUD: 1.390866,
 /* ... */
 }
 }
 
*/

struct jsonObject: Decodable
{
    var disclaimer: String?
    var license: String?
    var base: String?
    var rates: [String: Double] = [:]
    //var myValues: [Double] = []
    
}


