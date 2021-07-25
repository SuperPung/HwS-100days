//
//  AddView.swift
//  HabitTracking
//
//  Created by SUPER on 2021/7/25.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var description = ""
    @State private var finishNum: Int = 0
      
    @ObservedObject var activities: Activities
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                Stepper(value: $finishNum, in: 0...999) {
                    if finishNum <= 1 {
                        Text("Finished \(finishNum) time")
                    } else {
                        Text("Finished \(finishNum) times")
                    }
                }
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing: Button("Save") {
                let item = ActivityItem(name: self.name, description: self.description, finishNum: self.finishNum)
                self.activities.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
