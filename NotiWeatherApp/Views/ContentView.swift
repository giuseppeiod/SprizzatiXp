//
// ContentView.swift
// NotiWeatherApp
//
//  Created by Giuseppe Iodice 2022/12/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationViewModel = LocationViewModel()
    @ObservedObject private var viewModel: ViewModel = ViewModel()

    var body: some View {
        VStack {
            if let location = locationViewModel.location {
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
                if locationViewModel.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationViewModel)
                }
            }
        }
        .background(.white)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
