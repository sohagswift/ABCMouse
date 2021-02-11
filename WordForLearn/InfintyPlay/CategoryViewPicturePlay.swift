//
//  CategoryViewPicturePlay.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI
import AVFoundation
struct CategoryViewPicturePlay: View {
    var speaker = AVSpeechSynthesizer()
    @State var Viewindex = 3
    @State  var correctAnswer = 0
    @State  var items : Item? = nil
    @State var show = false
    @Namespace var namespace
    @State var didSetFire = true // due to xcode bug
    @State var selectedItem: CategorySectionContent? {
        didSet{
            if didSetFire {
                print(selectedItem?.title)
                askQustion()
            }
           
        }
    }
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
                       
                       // FromTextToImageQustionView(course: selectedItem!)
                        
                        if Viewindex == 2 {
                            ImageToTextQustionView(course: selectedItem!)
                           .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                           .frame(height:400)
                        }else{
                            FromTextToImageQustionView(course: selectedItem!)
                           .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                           .frame(height:200)
                        }
                         
                             CloseButton()
                                .padding(.trailing, 16)
                                .padding(.top, 40)
                            .onTapGesture{
                                withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                    show.toggle()
                                    selectedItem = nil
                                    didSetFire = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                        self.isDisable = false
                                    })
                                }
                            }
                    }
                   
                  
                     VStack{
                        LazyVGrid(
                            columns: [GridItem(),GridItem()],
                            spacing: 16
                        ){
                            ForEach(0..<4) { i in
                               
                                VStack {
                                   
                                    if Viewindex == 2 {
                                        TextPlayItemView(item: selectedItem!.items[i])
                                            .matchedGeometryEffect(id: selectedItem!.items[i].id, in: namespace, isSource: !show)
                                          //  .frame(height: 100)
                                        .onTapGesture{
                                            print("Double tapped!")
                                            self.flagTapped(i)
                                        }
                                    }else{
                                        PicturePlayItemView(item: selectedItem!.items[i])
                                            .matchedGeometryEffect(id: selectedItem!.items[i].id, in: namespace, isSource: !show)
                                            .frame(height: 200)
                                        .onTapGesture{
                                            print("Double tapped!")
                                            self.flagTapped(i)
                                        }
                                    }
                                        
                                   
                                }.matchedGeometryEffect(id: "container\(selectedItem!.items[i].id)", in: namespace)
                            }
                        }
                        .padding(16)
                        .frame(maxWidth:.infinity)
                        .animation(.some(.linear))
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
     func flagTapped(_ tag : Int){
        if tag == correctAnswer{
            textToSpeach("correct")
            var answerIndex = Int.random(in: 0...3)
            
            var allItems = selectedItem?.items
            var fromStart = allItems
            
            selectedItem?.items.shuffle()
            correctAnswer = Int.random(in: 0...3)
             askQustion()
        }else{
        
            textToSpeach("wrong")
        }
    }
    
     func askQustion(){
       print("we are working on it ")
        DispatchQueue.main.async {
            let name = selectedItem?.items[correctAnswer].name ?? ""
            var message = ""
            if Viewindex == 1 {
                message = "Which one\nis, \(name.capitalized)?"
            }else if Viewindex == 2 {
                message = "Which one is,\n_____?"
            }else{
                message = "Which one starts with\n the letter, \(name[0].capitalized)?"
            }
            let qustion = message.replacingOccurrences(of: ",", with: " ", options: NSString.CompareOptions.literal, range:nil)
            self.selectedItem?.title = qustion
            self.selectedItem?.image = name
            self.textToSpeach(qustion)
            
        }
        didSetFire = false 
    }
    
    func textToSpeach(_ str : String){
        let utterance = AVSpeechUtterance(string: str)
        utterance.pitchMultiplier = 1.5
        utterance.rate = 0.3
        self.speaker.speak(utterance)
    }
}

struct CategoryViewPicturePlay_Previews: PreviewProvider {
    static var previews: some View {
        CategoryViewPicturePlay()
    }
}


