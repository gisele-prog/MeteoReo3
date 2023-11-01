//
//  WeatherClouds.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//

import Foundation

struct WeatherClouds: Codable {
    let all: Int

    static func emptyInit() -> WeatherClouds {
        return WeatherClouds(all: 0)
    }
}
