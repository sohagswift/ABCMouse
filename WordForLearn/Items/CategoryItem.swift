//
//  CategoryItem.swift
//  WordForLearn
//
//  Created by Nazmul on 22/1/21.
//

import SwiftUI

struct CategoryItem: View {
    var course : Course =  courses[0]
    var body: some View {
        VStack(alignment: .leading, spacing: 0.4, content: {
            Spacer()
            HStack{
                Spacer()
                Image(course.image).resizable().aspectRatio(contentMode: .fit)
                Spacer()
            }
            Text(course.title).fontWeight(.bold)
            Text(course.subtitle).font(.footnote)
        })
       
        .padding(.all)
        .background(course.color)
        .cornerRadius(20.0)
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem()
    }
}
