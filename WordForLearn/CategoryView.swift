//
//  CategoryView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI

struct CategoryView: View {
    @State var show = false
    @Namespace var namespace
    var body: some View {
        ZStack{
            
            CategoryItem()
                .matchedGeometryEffect(id: "card", in: namespace, isSource: !show).frame(width: 280, height: 230)

            if show {
                ScrollView {
                    CategoryItem()
                        .matchedGeometryEffect(id: "card", in: namespace)
                        .frame(height:300)
                    VStack{
                        ForEach(0 ..< 5) { item in
                            CategoryRow()
                        }
                    }
                    
                } .transition(.opacity)
                .edgesIgnoringSafeArea(.all)
            }
            
        }
        .onTapGesture{
            withAnimation(.spring()){
                show.toggle()
            }
        }
        //  .animation(.spring())
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
