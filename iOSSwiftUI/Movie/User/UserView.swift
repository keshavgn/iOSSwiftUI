//
//  UserView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct UserView: View {
  @EnvironmentObject var userStore: UserStore
  @State private var userName = ""
  @State private var favoriteGenre = ""
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("User")) {
          TextField("User Name", text: $userName)
        }
        Section(header: Text("Favorite Genre")) {
          GenrePicker(genre: $favoriteGenre)
        }
      }
    }
    .navigationBarTitle(Text("\(userName) Info"), displayMode: .inline)
    .navigationBarItems(
      trailing:
        Button(action: updateUserInfo) {
          Text("Update")
        }
    )
    .onAppear {
      self.userName = self.userStore.currentUserInfo?.userName ?? ""
      self.favoriteGenre = self.userStore.currentUserInfo?.favoriteGenre ?? ""
    }
  }

  func updateUserInfo() {
    let newUserInfo = UserInfo(userName: userName, favoriteGenre: favoriteGenre)
    userStore.currentUserInfo = newUserInfo
    presentationMode.wrappedValue.dismiss()
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
  }
}
