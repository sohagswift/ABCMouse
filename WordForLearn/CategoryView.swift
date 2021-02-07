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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
           
            ScrollView{
                
                
                
                VStack(alignment: .leading, spacing:18){
                    
                    HStack {
                        Text("KidS WOrLd").font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                            .shadow(color: .gray, radius: 2, x: 0, y: 5)
                        CloseButton()
                            .padding(.trailing, 16)
                            .onTapGesture{
                                                             self.presentationMode.wrappedValue.dismiss()
                                                         }
                        
                    }.background(Image("Certificate3")
                                    .resizable()
                                    .scaledToFill())
                    
                  
                    ForEach(courses) { item in
                        CategoryItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(height: 230)
                            .padding(.trailing, 16)
                            .padding(.leading, 16)
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
                ZStack(alignment: .topTrailing){
                ScrollView {
                    CategoryItem(course: selectedItem!)
                        //.matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                        .frame(height:300)
                    CloseButton()
                        .padding(.trailing, 16)
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
                        LazyVGrid(
                            columns: [GridItem(),GridItem()],
                            spacing: 16
                        ){
                            ForEach(courses) { item in
                                VStack {
                                    CategoryItem(course: item)
                                        .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                        .frame(height: 200)
                                        .onTapGesture{
                                            withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                                show.toggle()
                                                selectedItem = item
                                                isDisable = true
                                            }
                                        }
                                        .disabled(isDisable)
                                }.matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource:!show)
                            }
                        }
                        .padding(16)
                        .frame(maxWidth:.infinity)
                    }
                    .zIndex(1)
                   
                    
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
        }
        //  .animation(.spring())
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
