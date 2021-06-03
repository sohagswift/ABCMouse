//
//  TryWriteItemView.swift
//  WordForLearn
//
//  Created by Nazmul on 21/3/21.
//

import SwiftUI


public struct TryWriteItemView: View {
    var course : String =  "A"
    var imageName : String =  "trace_ca"
   
    
    public  var body: some View {
        VStack(alignment: .leading, spacing: 0.4, content: {
            Spacer()
            HStack{
                Image("\(imageName)".replacingOccurrences(of: " ", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading,16)
                    .padding(.bottom,16)
                Spacer()
            }
//            if course.count > 1 {
//               // Text("\(course.lowercased())").fontWeight(.bold)
//
//            }else{
                Text("\(course[0].capitalized)").fontWeight(.bold)
           // }
           
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

struct TryWriteItemView_Previews: PreviewProvider {
    static var previews: some View {
        TryWriteItemView()
    }
}







