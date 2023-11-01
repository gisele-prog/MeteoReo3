//
//  Wind.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//


import Foundation

struct WeatherWind: Codable {
    let speed: Double
    let deg: Int?
    
    static func emptyInit() -> WeatherWind {
        return WeatherWind(speed: 0.0, deg: nil)
    }
}
