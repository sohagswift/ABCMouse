//
//  Sidebar.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
  
       NavigationView{
        #if os(iOS)
        content
        .navigationTitle("Learn")
        #else
        content.frame(minWidth:200,idealWidth:250,maxWidth:300)
        #endif
        ContentView()
        }
       
    }
    
    var content : some View {
        List{
            NavigationLink(destination: CategoryView()) {
                Label("Courses",systemImage:"book.closed")
            }
            Label("Tutorials",systemImage:"list.bullet.rectangle")
            Label("Livestreams",systemImage:"tv")
            Label("Certificates",systemImage:"mail.stack")
            Label("Search",systemImage:"magnifyingglass")
        }
        .listStyle(SidebarListStyle())
       
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
