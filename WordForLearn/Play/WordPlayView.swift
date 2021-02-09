//
//  WordPlayView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 9/2/21.
//

import SwiftUI



public struct WordPlayView: View {
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
            Text(course.title).fontWeight(.bold).font(.largeTitle)
            Text(course.subtitle).font(.footnote)
        }).background(Image("kidsbackground")
                        .resizable()
                        .scaledToFill())
       
        .padding(.all)
        .background(Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)))
        
        .cornerRadius(20.0)
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct WordPlayView_Previews: PreviewProvider {
    static var previews: some View {
        WordPlayView()
    }
}






