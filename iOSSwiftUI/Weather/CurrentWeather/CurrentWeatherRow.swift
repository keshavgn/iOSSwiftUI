//
//  CurrentWeatherRow.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct CurrentWeatherRow: View {
  private let viewModel: CurrentWeatherRowViewModel
  
  init(viewModel: CurrentWeatherRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      MapView(coordinate: viewModel.coordinate)
        .cornerRadius(25)
        .frame(height: 300)
        .disabled(true)
      
      VStack(alignment: .leading, spacing: 20) {
        HStack {
          Text("☀️ Temperature:")
          Text("\(viewModel.temperature)°")
            .foregroundColor(.gray)
        }
        
        HStack {
          Text("📈 Max temperature:")
          Text("\(viewModel.maxTemperature)°")
            .foregroundColor(.gray)
        }
        
        HStack {
          Text("📉 Min temperature:")
          Text("\(viewModel.minTemperature)°")
            .foregroundColor(.gray)
        }
        
        HStack {
          Text("💧 Humidity:")
          Text(viewModel.humidity)
            .foregroundColor(.gray)
        }
        Spacer()
      }
    }
  }
}

struct CurrentWeatherRow_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
