//
//  ApiClient.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 01/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import Combine

class APIClient {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func forecast<T>( with components: URLComponents) -> AnyPublisher<T, MyError> where T: Decodable {
    guard let url = components.url else {
      let error = MyError.network(description: "Couldn't create URL")
      return Fail(error: error).eraseToAnyPublisher()
    }
    
    return session.dataTaskPublisher(for: URLRequest(url: url))
      .mapError { error in
        .network(description: error.localizedDescription)
    }
    .flatMap(maxPublishers: .max(1)) { pair in
      Parsing.decode(pair.data)
    }
    .eraseToAnyPublisher()
  }
  
}
