//
//  WeatherDescriptionss.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 11/1/23.
//


import SwiftUI
import Foundation


let weatherDescriptionToIcon: [String: (icon: String, color: Color)] = [
    "light rain": ("cloud.drizzle.fill", .black),
    "scattered clouds": ("cloud.fill", .black),
    "few clouds": ("cloud.sun", .white),
    "clear sky": ("sun.max.fill", .white),
    "broken clouds": ("icloud.fill", .black)
]
