//
//  DetailView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct DetailView: View {
  var item: Employee
  @State private var isZoomed = false
    var body: some View {
      VStack {
        InfoView(item: item)
        Image(item.imageName).resizable()
          .aspectRatio(contentMode: isZoomed ? .fill : .fit)
          .onTapGesture {
            withAnimation {
              self.isZoomed.toggle()
            }
        }
      }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: employees[0])
    }
}
