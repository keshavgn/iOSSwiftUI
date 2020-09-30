//
//  UserStore.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import Combine

class UserStore: ObservableObject {
  @Published var currentUserInfo: UserInfo?
}
