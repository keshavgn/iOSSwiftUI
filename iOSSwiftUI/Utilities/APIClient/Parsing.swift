//
//  Parsing.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import Combine

enum Parsing {
  static func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, MyError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    
    return Just(data)
      .decode(type: T.self, decoder: decoder)
      .mapError { error in
        .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
  }
}
