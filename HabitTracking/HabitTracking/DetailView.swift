//
//  DetailView.swift
//  HabitTracking
//
//  Created by SUPER on 2021/7/25.
//

import SwiftUI

struct DetailView: View {
    let activity: ActivityItem
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text(activity.description)
                    .padding()
                Text("You have finished this activity \(activity.finishNum) \(activity.finishNum <= 1 ? "time" : "times")!")
            }  
        }
        .navigationBarTitle(Text(activity.name), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activity: ActivityItem(name: "Test name", description: "Test description", finishNum: 0))
    }
}
