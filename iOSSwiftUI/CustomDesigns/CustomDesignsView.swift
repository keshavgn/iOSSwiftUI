//
//  AccessoryView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 02/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

enum SmartView {
  case lair
  case camera
  case automation
  case settings
}

struct CustomDesignsView: View {
  @State var selectedItem = SmartView.lair
  
  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        ZStack {
          if self.selectedItem == .lair {
            LairView()
            CameraView().hidden()
            AutomationView().hidden()
            SettingsView().hidden()
          } else if self.selectedItem == .camera {
            LairView().hidden()
            CameraView()
            AutomationView().hidden()
            SettingsView().hidden()
          } else if self.selectedItem == .automation {
            LairView().hidden()
            CameraView().hidden()
            AutomationView()
            SettingsView().hidden()
          } else {
            LairView().hidden()
            CameraView().hidden()
            AutomationView().hidden()
            SettingsView()
          }
        }

        TabBarView(selectedItem: self.$selectedItem,
          tabBarItems: [
            TabBarItemView(selectedItem: self.$selectedItem,
                           smartView: .lair, icon: "pencil.tip"),
            TabBarItemView(selectedItem: self.$selectedItem,
                           smartView: .camera, icon: "video.circle"),
            TabBarItemView(selectedItem: self.$selectedItem,
                           smartView: .automation, icon: "alarm"),
            TabBarItemView(selectedItem: self.$selectedItem,
                           smartView: .settings, icon: "gear")
        ])
          .padding(.bottom, geometry.safeAreaInsets.bottom / 2)
          .background(Color.lairBackgroundGray)
      }
      .edgesIgnoringSafeArea(.bottom)
    }
    .navigationBarTitle("Custom UI", displayMode: .inline)
  }
}

struct CustomDesignsView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
