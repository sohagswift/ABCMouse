//
//  CategoryView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI
import AVFoundation
import StoreKit

struct latterToWordView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: CategorySectionContent? = nil
    @State var isDisable = false
    @Binding var fromHome : Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var speaker = AVSpeechSynthesizer()
  
    
    
    func rateApp() {

        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                  SKStoreReviewController.requestReview(in: scene)
              }
    }
    
    var body: some View {
        
        VStack{
            
            if !show {
            
            HStack {
                Text("KidS_WOrLd".localizedStringForKey()).font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .shadow(color: .gray, radius: 2, x: 0, y: 5)
                Spacer()
                
             
                    
                    HStack{
                        Button(action: {
                            withAnimation {
                                rateApp()
                            }
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green)
                                    .frame(width: 45, height: 45)
                                    .rotationEffect(.degrees(45))

                                Image(systemName: "star")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        })
                        
                        CloseButton()
                            .padding(.trailing, 16)
                            .onTapGesture{
                                fromHome = false

                                                         }

                    }
                    
                    
                
                

                
            }.background(Image("Certificate3")
                            .resizable()
                            .scaledToFill())
            }
        ZStack{
           
            ScrollView{
                
                
                
                VStack(alignment: .leading, spacing:18){
                    
                 
                    
                  
                    ForEach(categorySectionContents) { item in
                        CategoryItemSection(course: item)
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
                VStack(){
                ScrollView {
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                        CategoryItemSection(course: selectedItem!)
                            .padding(.top,44)
                         
                            //.matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                            .frame(height:230)
                             CloseButton()
                                .padding(.trailing, 16)
                                .padding(.top, 50)
                            .onTapGesture{
                                withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                    show.toggle()
                                    
                                    selectedItem = nil
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                        self.isDisable = false
                                        speaker.stopSpeaking(at: .immediate)
                                    })
                                }
                            }
                    }
                   
                  
                     VStack{
                        LazyVGrid(
                            columns: [GridItem(),GridItem()],
                            spacing: 16
                        ){
                            ForEach(selectedItem!.items) { item in
                               
                                VStack {
                                   
                                    CategoryItemPlay(item: item)
                                        .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                        .frame(height: 200)
                                        .onTapGesture{
                                            print("Hi, uh.. I'm a.. um kid!")
                                            
                                            var str = item.name.lowercased()
                                            if str.count > 1 {
                                                str =  "\(Array(item.name)[0].lowercased()), is for \(item.name.lowercased())"
                                            }
                                            let utterance = AVSpeechUtterance(string: str)
                                            utterance.pitchMultiplier = 1.5
                                            utterance.rate = 0.3
                                            self.speaker.speak(utterance)
                                           
//                                            withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
////                                                show.toggle()
////                                                //selectedItem = item
////                                                isDisable = true
//                                            }
                                        }
                                        //.disabled(isDisable)
                                }.matchedGeometryEffect(id: "container\(item.id)", in: namespace)
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
        }
        //  .animation(.spring())
    }
}

//struct latterToWordView_Previews: PreviewProvider {
//    static var previews: some View {
//        latterToWordView()
//    }
//}
