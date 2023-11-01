//
//  ContentView.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @State private var isAnimating = true
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                          
                if weatherViewModel.stateView == .loading {
                               
                    ActivityIndicatorView(isAnimating: $isAnimating)
                                  
                          .frame(width: 50, height: 50)
                          .foregroundColor(.white)
                            }
                
                
                if weatherViewModel.stateView  == .success {
                    LocationAndTemperatureHeaderView(data: weatherViewModel.currentWeather)
                    Spacer()

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            DailyWeatherCellView(data: weatherViewModel.todayWeather)
                            Rectangle().frame(height: CGFloat(1))

                            HourlyWeatherView(data: weatherViewModel.hourlyWeathers)
                            Rectangle().frame(height: CGFloat(1))

                            DailyWeatherView(data: weatherViewModel.dailyWeathers)
                            Rectangle().frame(height: CGFloat(1))

                            Text(weatherViewModel.currentDescription)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(
                                    .init(arrayLiteral:.leading,.trailing),
                                    24
                                )
                            Rectangle().frame(height: CGFloat(1))

                            DetailsCurrentWeatherView(data: weatherViewModel.currentWeather)
                            Rectangle().frame(height: CGFloat(1))

                        }
                    }
                    Spacer()
                }
                
                if weatherViewModel.stateView == .failed {
                    Button(action: {
                        self.weatherViewModel.retry()
                    }) {
                        Text("Failed get data, retry?")
                            .foregroundColor(.white)
                    }
                }
            }
        }.colorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
