//
//  ContentView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 20/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        VStack(alignment: .leading, spacing: 0.4, content: {
            Spacer()
            HStack{
                Spacer()
                Image("Illustration1").resizable().aspectRatio(contentMode: .fit)
                Spacer()
            }
            Text("SwiftUI for ios 14").fontWeight(.bold)
            Text("20 Secton Spacer()   ").font(.footnote)
        })
       
        .padding(.all)
        .background(Color.blue)
        .cornerRadius(20.0)
        .shadow(radius: 20)
        
        
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
        ContentView().previewLayout(.fixed(width: 200.0, height: 200.0))
        
    }
}
