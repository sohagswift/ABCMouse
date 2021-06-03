//
//  LeanNumberItemView.swift
//  WordForLearn
//
//  Created by Nazmul on 3/6/21.
//

import SwiftUI


public struct LeanNumberItemView: View {
    var number : String =  "12"
    var word : String =  ""
   
    
    public  var body: some View {
        VStack(alignment: .leading, spacing: 0.4, content: {
            Spacer()
            HStack{
                Image("\(number[0])".replacingOccurrences(of: "", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading,16)
                    .padding(.bottom,16)
                Image("\(number.count > 1 ? number[1] : "" )".replacingOccurrences(of: "", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading,16)
                    .padding(.bottom,16)
                Image("\(number.count > 2 ? number[2] : "" )".replacingOccurrences(of: "", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading,16)
                    .padding(.bottom,16)
                Image("\(number.count > 3 ? number[3] : "" )".replacingOccurrences(of: "", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading,16)
                    .padding(.bottom,16)
                Spacer()
            }
        
                Text("\(word.capitalized)").fontWeight(.bold).padding(.top)
           
           
            //Text(course.subtitle).font(.footnote)
        })
        
        //.background(Image("kidsbackground")
//                        .resizable()
//                        .scaledToFill())
       
      
        .padding(.all)
        .border(Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
         
        .cornerRadius(20.0)
        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct LeanNumberItemView_Previews: PreviewProvider {
    static var previews: some View {
        LeanNumberItemView()
    }
}
