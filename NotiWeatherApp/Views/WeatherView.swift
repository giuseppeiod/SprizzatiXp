//
//  WeatherApp.swift
//  NotiWeatherApp
//
//  Created by Giuseppe Iodice 2022/12/10.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var notificationViewModel = NotificationViewModel()
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack{
                        Spacer()
                        
                        Text(weather.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            
                        Spacer()
                    }
                    
                    Text(
                        "Today, \(Date().formatted(.dateTime.month().day().hour().minute()))"
                    )
                    .fontWeight(.light)
                    .foregroundColor(.black)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + " °C" )
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding()
                    }
                    
                    Spacer()
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Button(){
                        notificationViewModel.requestNotification(
                            subtitle:
                                "\(weather.weather[0].description), min of \(weather.main.tempMin.roundDouble())°C and max of \(weather.main.tempMax.roundDouble())°C"
                        )
                    }
                    label: {
                        Label("Weather Now", systemImage: "info.bubble.fill")
                    }
                    .padding()
                        
                    
                    HStack {
                        WeatherRow(
                            logo: "thermometer",
                            name: "Min temp",
                            value: (weather.main.tempMin.roundDouble() + ("°"))
                        )
                        
                        Spacer()
                        
                        WeatherRow(
                            logo: "thermometer",
                            name: "Max temp",
                            value: (weather.main.tempMax.roundDouble() + "°")
                        )
                    }
                    
                    HStack {
                        WeatherRow(
                            logo: "wind",
                            name: "Wind speed",
                            value: (weather.wind.speed.roundDouble() + " m/s")
                        )
                        
                        Spacer()
                        
                        WeatherRow(
                            logo: "humidity",
                            name: "Humidity",
                            value: "\(weather.main.humidity.roundDouble())%"
                        )
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .background(Color(.systemBackground))
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Image(weather.weather[0].mainImage))
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
