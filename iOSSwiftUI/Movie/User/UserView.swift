//
//  UserView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct UserView: View {
  @State private var userName = ""
  @State private var favoriteGenre = ""
  @Environment(\.presentationMode) var presentationMode
  
  @FetchRequest(entity: UserInfo.entity(), sortDescriptors: [
      NSSortDescriptor(keyPath: \UserInfo.name, ascending: true)
    ]
  )
  var user: FetchedResults<UserInfo>

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
      self.userName = self.user.first?.name ?? ""
//      self.favoriteGenre = self.userStore.currentUserInfo?.favoriteGenre ?? ""
    }
  }

  func updateUserInfo() {
    if let user = self.user.first {
      user.name = userName
    } else {
      let newUserInfo = UserInfo(context: CoreDataManager.shared.context)
      newUserInfo.name = userName
    }
    CoreDataManager.shared.saveContext()
    presentationMode.wrappedValue.dismiss()
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
  }
}
