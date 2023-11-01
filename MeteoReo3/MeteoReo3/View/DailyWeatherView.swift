//
//  DailyWeatherView.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//

import SwiftUI

struct DailyWeatherView: View {
    let data: [ForecastWeather]
    
    var body: some View {
        VStack {
            ForEach(data, id: \.date) { data in
                DailyWeatherCellView(data: data)
            }
        }
    }
}

