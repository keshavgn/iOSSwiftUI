//
//  SplashScreen.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 05/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct ViperHomeView: View {
  @EnvironmentObject var model: DataModel

  var body: some View {
    TripListView(presenter:
      TripListPresenter(interactor:
        TripListInteractor(model: model)))
      .navigationBarTitle("Viper Architecture", displayMode: .inline)
  }
}

#if DEBUG
struct ViperHomeView_Previews: PreviewProvider {
  static var previews: some View {
    let model = DataModel.sample
    return ViperHomeView()
      .environmentObject(model)
  }
}
#endif
