//
//  CategoryList.swift
//  WordForLearn
//
//  Created by Nazmul on 22/1/21.
//

import SwiftUI

struct CategoryList: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content.listStyle(InsetGroupedListStyle())
        .navigationTitle("Courses")
        #else
        content.frame(minWidth:800,minHeight:600)
        #endif
    }
    
    var content : some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            CategoryRow()
                .navigationTitle("Courses")
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
