//
//  CategoryItemSection.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 7/2/21.
//

import SwiftUI

//
//  CategoryItem.swift
//  WordForLearn
//
//  Created by Nazmul on 22/1/21.
//

import SwiftUI

public struct CategoryItemSection: View {
    var course : CategorySectionContent =  categorySectionContents[1]
   
    
    public  var body: some View {
        VStack(alignment: .leading, spacing: 0.4, content: {
            Spacer()
            HStack{
                Image(course.items[0].name.replacingOccurrences(of: " ", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading,32)
                    .padding(.bottom,16)
                Spacer()
            }
            Text(course.title).fontWeight(.bold)
            Text(course.subtitle).font(.footnote)
            
            HStack{
                Image(course.items[0].name.replacingOccurrences(of: " ", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading,32)
                    .padding(.bottom,16)
                Spacer()
            }
            
        }).background(Image("indivudule")
                        .resizable()
                        .scaledToFill())
       
        .padding(.all)
        .background(Color.orange)
        
        .cornerRadius(20.0)
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct CategoryItemSection_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemSection()
    }
}




