//
//  DetailView.swift
//  UserFriends
//
//  Created by SUPER on 2021/8/2.
//

import SwiftUI

struct LineView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            
            Spacer()
            
            Text(content)
                .font(.title3)
                .foregroundColor(.blue)
        }
    }
}

struct DetailView: View {
    var user: User
    
    var body: some View {
        Form {
            VStack {
                ZStack {
                    Circle()
                        .padding(-30)
                        .foregroundColor(.gray)
                        
                    Text(user.name.prefix(1).uppercased())
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
                .padding(30)
                
                Text(user.name)
                    .font(.system(size: 40))
                
                Text(user.isActive ? "online" : "offline")
                    .foregroundColor(user.isActive ? .green : .red)
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("Tags")
                    
                    Spacer()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(user.tags, id: \.self) { tag in
                                Text(tag)
                            }
                        }
                    }
                    .font(.title3)
                    .foregroundColor(.blue)
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("About")
                    
                    Spacer()
                    
                    Text(user.about)
                        .font(.callout)
                        .foregroundColor(.blue)
                }
            }
            
            Section {
                LineView(title: "Age", content: "\(user.age)")
                LineView(title: "Company", content: user.company)
            }
            
            Section {
                LineView(title: "Email", content: user.email)
                LineView(title: "Address", content: user.address)
            }
            
            Section {
                LineView(title: "Registered date", content: user.registered)
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("Friends")
                    
                    Spacer()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(user.friends, id: \.id) { friend in
                                Text(friend.name)
                            }
                        }
                    }
                    .font(.title3)
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: "123", isActive: true, name: "super", age: 20, company: "TJU", email: "me@superpung.xyz", address: "TJU", about: "beginner", registered: "2021.1.1", tags: ["tag1", "tag2", "tag1", "tag2"], friends: [Friend(id: "124", name: "repus")]))
    }
}
