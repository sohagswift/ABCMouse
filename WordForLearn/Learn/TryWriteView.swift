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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            
            VStack(alignment: .leading, spacing:18){
                
                HStack {
                    Text("Tracing").font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                        .shadow(color: .gray, radius: 2, x: 0, y: 5)
                    CloseButton()
                        .padding(.trailing, 16)
                        .onTapGesture{
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    
                }.background(Image("Certificate3")
                                .resizable()
                                .scaledToFill())
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
            
        }
        
        //  .animation(.spring())
    }
}

struct TryWriteView_Previews: PreviewProvider {
    static var previews: some View {
        TryWriteView()
    }
}
