//
// ContentView.swift
// NotiWeatherApp
//
//  Created by Giuseppe Iodice 2022/12/10.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ViewModel()
    var body: some View {
        VStack {
            if let location = viewModel.locationManager.location {
                if let weather = viewModel.weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                viewModel.weather = try await viewModel.weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if viewModel.locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(viewModel.locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

