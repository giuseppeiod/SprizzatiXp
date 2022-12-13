//
//  ViewModel.swift
//  NotiWeatherApp
//
//  Created by Bryan Sánchez Peralta on 12/12/22.
//

import Foundation
extension ContentView {
    class ViewModel: ObservableObject {
        @Published var weatherManager = WeatherManager()
        @Published var weather: ResponseBody?
    }
}
