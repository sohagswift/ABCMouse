//
//  TryWriteView.swift
//  WordForLearn
//
//  Created by Nazmul on 20/3/21.
//


//
//  ItemPlayQuizView
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI

struct TryWriteView: View {
    @Namespace var namespace
    @State var presentingModal = false
   // @State var seletedItem = ""
    var body: some View {
        ZStack{
            ScrollView{
                LazyVGrid(
                    columns: [GridItem(),GridItem()],
                    spacing: 16
                ){
                    ForEach(WordData.typeWordAlphabets.indices) { item in
                        VStack {
                            TryWriteItemView(course: "a")
                                .frame(height: 200)
                                .onTapGesture{
                                    withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                        UserDefaults.standard.setValue("trace_ca", forKey: "charaterHandwriten")
                                       // print(seletedItem)
                                        self.presentingModal = true
                                   
                                    }
                                }.fullScreenCover(isPresented: $presentingModal) {
                                    NavigationView {
                                        DrawingWrapper(imageName:  UserDefaults.standard.string(forKey: "charaterHandwriten") ?? "trace_ca")
                                            .toolbar {
                                                ToolbarItem(placement: .navigationBarTrailing) {
                                                    Button(action: {
                                                      
                                                        presentingModal = false
                                                    }, label: {
                                                        Text("Dismiss")
                                                    })
                                                }
                                            }
                                    }
                                }
                        }
                    }
                }
                

                .padding(16)
                .frame(maxWidth:.infinity)
            }
            .zIndex(1)
            

            
        }
        
        //  .animation(.spring())
    }
}

struct TryWriteView_Previews: PreviewProvider {
    static var previews: some View {
        TryWriteView()
    }
}
