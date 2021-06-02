//
//  CategoryItemPlay.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 7/2/21.
//

import SwiftUI

public struct CategoryItemPlay: View {
    var item : Item
    var color : Color =  Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0.4, content: {
            Spacer()
            HStack{
                Spacer()
                Image(item.name.replacingOccurrences(of: " ", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                Spacer()
            }
            Text(item.name.capitalized).fontWeight(.bold)
            //Text(course.subtitle).font(.footnote)
        })
       
        .padding(.all)
        .border(Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .cornerRadius(20.0)
        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct CategoryItemPlay_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemPlay(item: Item(name : "Certificate2"))
    }
}
