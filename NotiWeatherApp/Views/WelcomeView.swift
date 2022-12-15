//
//  WelcomeView.swift
//  NotiWeatherApp
//
//  Created by Giuseppe Iodice 2022/12/10.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image(systemName: "cloud.sun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.systemBlue)
                    .frame(width: 200.0)
                
                Text("NotiWeather")
                    .bold()
                    .font(.title)
                    .foregroundColor(.systemBlue)
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .labelStyle(.titleAndIcon)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
