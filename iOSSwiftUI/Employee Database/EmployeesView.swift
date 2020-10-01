//
//  EmployeesView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct EmployeesView: View {
  @ObservedObject var store: Store

  var body: some View {
    List {
      Section {
        Button (action: addEmployee) {
          Text("Add Employee")
        }
      }
      Section {
        ForEach (store.employees) { item in
          EmployeeCellView(item: item)
        }
        .onDelete(perform: deleteEmployee(offsets:))
        .onMove(perform: moveEmployee(offsets:on:))
      }
    }
    .navigationBarTitle(Text("Employees"), displayMode: .inline)
    .listStyle(GroupedListStyle())
    .navigationBarItems(trailing: EditButton())
  }
  
  func addEmployee() {
    store.employees.append(Employee(name: "New Developer", designation: "iOS Developer", experience: 2))
  }

  func deleteEmployee(offsets: IndexSet) {
    store.employees.remove(atOffsets: offsets)
  }

  func moveEmployee(offsets: IndexSet, on destination: Int) {
    store.employees.move(fromOffsets: offsets, toOffset: destination)
  }
}

struct EmployeesView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesView(store: Store(employees: employees))
    }
}

struct EmployeeCellView: View {
  var item: Employee
  var body: some View {
    NavigationLink (destination: DetailView(item: item)) {
      Image(item.thumbnailName)
        .cornerRadius(6)
      InfoView(item: item)
    }
  }
}

struct InfoView: View {
  var item: Employee
  var body: some View {
    VStack(alignment: .leading) {
      Text(item.name)
      Text(item.designation + "\(item.experience) years of Experience")
    }
  }
}
