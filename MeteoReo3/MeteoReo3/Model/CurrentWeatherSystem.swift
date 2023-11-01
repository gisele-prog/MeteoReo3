//
//  CurrentWeatherSystem.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//


import Foundation

struct CurrentWeatherSys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
    
    static func emptyInit() -> CurrentWeatherSys {
        return CurrentWeatherSys(
            type: 0,
            id: 0,
            country: "",
            sunrise: 0,
            sunset: 0
        )
    }
}
