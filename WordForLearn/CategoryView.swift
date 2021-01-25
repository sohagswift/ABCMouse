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
    @State var selectedItem: Course? = nil
    @State var isDisable = false
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing:20){
                    ForEach(courses) { item in
                        CategoryItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(width: 280, height: 230)
                            .onTapGesture{
                                withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                    show.toggle()
                                    selectedItem = item
                                    isDisable = true
                                }
                            }
                            .disabled(isDisable)
                    }
//                    CategoryItem()
//                        .frame(width: 280, height: 230)
                }.frame(maxWidth:.infinity)
            }
            
            if selectedItem != nil {
                ScrollView {
                    CategoryItem(course: selectedItem!)
                        .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                        .frame(height:300)
                        .onTapGesture{
                            withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                show.toggle()
                                selectedItem = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                    self.isDisable = false
                                })
                            }
                        }
                    VStack{
                        ForEach(categorySections) { item in
                            CategoryRow(item: item)
                            Divider()
                        }
                    }
                    
                }
                .background(Color.white)
                .transition(
                    .asymmetric(insertion:
                                    AnyTransition
                                    .opacity
                                    .animation(Animation.spring().delay(0.1)),
                                removal:
                                    AnyTransition
                                    .opacity
                                    .animation(Animation.spring()))
                )
                .edgesIgnoringSafeArea(.all)

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
