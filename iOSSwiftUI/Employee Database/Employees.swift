//
//  Employees.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Employee: Identifiable {
  var id = UUID()
  var name: String
  var designation: String
  var experience: Int
  var imageName: String { return name }
  var thumbnailName: String { return name + " thumb" }
}

let employees = [ Employee(name: "Keshav", designation: "iOS Developer", experience: 5),
                  Employee(name: "Pavan Kumar", designation: "Android Developer", experience: 8),
                  Employee(name: "Mahesh", designation: "Java Developer", experience: 3),
                  Employee(name: "Deepak Dixit", designation: "iOS App Tester", experience: 10),
                  Employee(name: "Sanchari", designation: "Backend Developer", experience: 4),
                  Employee(name: "Murthy", designation: "Engineering Manager", experience: 13)]


class Store: ObservableObject {
  @Published var employees: [Employee]

  init(employees: [Employee]) {
    self.employees = employees
  }
}
