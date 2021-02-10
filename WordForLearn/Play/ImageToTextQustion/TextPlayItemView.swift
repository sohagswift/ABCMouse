
//
//  TextPlayItemView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 10/2/21.
//

import SwiftUI

struct TextPlayItemView: View {
    var item : Item
    var color : Color =  Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.4, content: {
            //Spacer()
            HStack{
             
                Text(item.name.capitalized).fontWeight(.bold).font(.title).padding(.all,5)
               
            }
           // Text(item.name.capitalized).fontWeight(.bold)
            //Text(course.subtitle).font(.footnote)
        })
       
        .padding(.all)
        .background(color)
        .cornerRadius(20.0)
        .shadow(color: color.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct TextPlayItemView_Previews: PreviewProvider {
    static var previews: some View {
        TextPlayItemView(item: Item(name : "Certificate2"))
    }
}

