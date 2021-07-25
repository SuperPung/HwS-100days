//
//  ContentView.swift
//  HabitTracking
//
//  Created by SUPER on 2021/7/25.
//

import SwiftUI

class Activities: ObservableObject {
    @Published var items = [ActivityItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ActivityItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}

struct ContentView: View {
    @State private var showingAdd = false
    @ObservedObject var activities = Activities()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink(destination: DetailView(activity: item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.title2)
                                Spacer()
                                Text(item.description)
                                    .font(.body)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Text("\(item.finishNum) done")
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("HabitTracking")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { self.showingAdd = true }) { Image(systemName: "plus") })
            .sheet(isPresented: $showingAdd) {
                AddView(activities: self.activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
