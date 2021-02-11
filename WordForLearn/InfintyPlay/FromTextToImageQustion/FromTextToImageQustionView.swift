//
//  PicturePlayView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 9/2/21.
//

import SwiftUI



public struct FromTextToImageQustionView: View {
    var course : CategorySectionContent =  categorySectionContents[1]
   
    
    public  var body: some View {
        VStack(alignment: .leading, spacing: 0.4, content: {
           // Spacer()
            ZStack{
//                Image("kidsbackground").resizable().aspectRatio(contentMode: .fit)
//                    .padding(.leading,32)
//                    .padding(.bottom,16)
                //Spacer()
                VStack{
                 
                    Text(course.title).fontWeight(.bold).font(.largeTitle).multilineTextAlignment(.center)
//                  .frame(maxWidth: .infinity, alignment: .leading)
                  .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(.all,5)
                        .padding(.bottom,15)
                }
                .frame(width: 380)
               // .background(Color.gray.opacity(0.1))
                    //.padding(.bottom, 16)
            }
           
            //Text(course.subtitle).font(.footnote)
        })
        .frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                )
       
        .padding(.top,50)
        .background(Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)))
        
        .cornerRadius(20.0)
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
    }
}

struct FromTextToImageQustionView_Previews: PreviewProvider {
    static var previews: some View {
        FromTextToImageQustionView()
    }
}





