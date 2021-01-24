//
//  CategoryView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI

struct CategoryView: View {
    @State var show = false
    var body: some View {
        ZStack{
            CategoryItem().frame(width: 280, height: 230)
            
            VStack{
                if show {
                    CategoryItem()
                        .transition(.move(edge: .bottom))
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .onTapGesture{
            show.toggle()
        }
        .animation(.spring())
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
