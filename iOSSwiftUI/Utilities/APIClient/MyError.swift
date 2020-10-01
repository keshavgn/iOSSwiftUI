//
//  MyError.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation

enum MyError: Error {
  case parsing(description: String)
  case network(description: String)
}
