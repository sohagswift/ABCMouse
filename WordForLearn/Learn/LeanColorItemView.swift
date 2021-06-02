//
//  LeanColorItemView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 2/6/21.
//

import SwiftUI

//
//  TryWriteItemView.swift
//  WordForLearn
//
//  Created by Nazmul on 21/3/21.
//

import SwiftUI


public struct LeanColorItemView: View {
    var course : String =  "A"
    var imageName : UIColor = UIColor.red
   
    
    public  var body: some View {
        VStack(alignment: .leading, spacing: 0.4, content: {
            Spacer()
            HStack{
                Image("".replacingOccurrences(of: " ", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading,16)
                    .padding(.bottom,16)
                Spacer()
            }
            .background(Color(imageName))
            if course.count > 1 {
                Text("\(course.capitalized)").fontWeight(.bold).padding(.top)
            }else{
                Text("\(course.uppercased())\(course.lowercased())").fontWeight(.bold)
            }
           
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

struct LeanColorItemView_Previews: PreviewProvider {
    static var previews: some View {
        LeanColorItemView()
    }
}







