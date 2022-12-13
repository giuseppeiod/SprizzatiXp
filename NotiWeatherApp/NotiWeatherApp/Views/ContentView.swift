//
// ContentView.swift
// NotiWeatherApp
//
//  Created by Giuseppe Iodice 2022/12/10.
//

import SwiftUI

struct ContentView: View {
    // Replace YOUR_API_KEY in WeatherManager by your own for the app to work
    @StateObject var locationManager = LocationManager()
    @ObservedObject private var viewModel: ViewModel = ViewModel()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = viewModel.weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                viewModel.weather = try await viewModel.weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: (error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(.white))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
