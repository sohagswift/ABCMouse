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
        .background(color)
        .cornerRadius(20.0)
        .shadow(color: color.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct CategoryItemPlay_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemPlay(item: Item(name : "Certificate2"))
    }
}
