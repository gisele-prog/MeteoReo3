//
//  coordinate.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//



import Foundation

struct Coordinate: Codable {
    let lon, lat: Double
    
    static func emptyInit() -> Coordinate {
        return Coordinate(lon: 0, lat: 0)
    }
}
