//
//  ItemPlayQuizView
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI

struct ItemPlayQuizView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: Course? = nil
    @State var isDisable = false
    var body: some View {
        ZStack{
            ScrollView{
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
            
            if selectedItem != nil {
                ZStack(alignment: .topTrailing) {
                    ItemPlayQuizDetails(course:selectedItem!,namespace: namespace)
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
                }
                .zIndex(2)
            }
            
        }
        
        //  .animation(.spring())
    }
}

struct ItemPlayQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPlayQuizView()
    }
}
