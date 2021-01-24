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
            ScrollView{
                VStack(spacing:20){
                    ForEach(courses) { item in
                        CategoryItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show).frame(width: 280, height: 230)
                    }
//                    CategoryItem()
//                        .frame(width: 280, height: 230)
                }.frame(maxWidth:.infinity)
            }
            
            if show {
                ScrollView {
                    CategoryItem(course: courses[2])
                        .matchedGeometryEffect(id: courses[2].id, in: namespace)
                        .frame(height:300)
                    VStack{
                        ForEach(0 ..< 5) { item in
                            CategoryRow()
                        }
                    }
                    
                }
                .background(Color.white)
                .transition(
                    .asymmetric(insertion:
                                    AnyTransition
                                    .opacity
                                    .animation(Animation.spring().delay(0.3)),
                                removal:
                                    AnyTransition
                                    .opacity
                                    .animation(Animation.spring()))
                )
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
