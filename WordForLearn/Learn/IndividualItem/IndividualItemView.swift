//
//  IndividualItemView.swift
//  WordForLearn
//
//  Created by Nazmul on 26/3/21.
//

import SwiftUI

public struct IndividualItemView: View {
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
            
           
            
        }).background(Image("indivudule")
                        .resizable()
                        .scaledToFill())
       
        .padding(.all)
        .background(Color.orange)
        
        .cornerRadius(20.0)
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct IndividualItemView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualItemView()
    }
}
