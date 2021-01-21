//
//  CategoryDetails.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI

struct CategoryDetails: View {
    @State var show = false
    var body: some View {
        ZStack{
            ContentView().frame(width: 280, height: 230)
            
            if show {
                ContentView()
                    .transition(.move(edge: .bottom))
                    .edgesIgnoringSafeArea(.all)
                  
            }
        }
        .onTapGesture{
            show.toggle()
        }
        .animation(.spring())
    }
}

struct CategoryDetails_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetails()
    }
}
