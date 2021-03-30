//
//  individualView.swift
//  WordForLearn
//
//  Created by Nazmul on 20/3/21.
//

//
//  CategoryViewPicturePlay.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI
import AVFoundation
struct IndividualView: View {
    var speaker = AVSpeechSynthesizer()
    @State var Viewindex = 2
    @State  var correctAnswer = 0
    @State  var items =  [Item]()
    @State var show = false
    @Namespace var namespace
    @State var didSetFire = true // due to xcode bug
    @State var selectedItem: CategorySectionContent? {
        didSet{
            if didSetFire {
                basedOnItem()
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
                                IndividualLearnItemView(course: selectedItem!).id(UUID())
                                    .onTapGesture{
                                        withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                                                self.textToSpeach("\(selectedItem?.items[correctAnswer].name ?? "".lowercased())")
                                            })
                                        }
                                    }
                                    .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                                    .frame(height:UIScreen.screenHeight/1.5)
                                   // .frame(minWidth: 0,
//                                                    maxWidth: .infinity,
//                                                    minHeight: 0,
//                                                    maxHeight: .infinity,
//                                                    alignment: .topLeading)
                                
                            }else{
                                FromTextToImageQustionView(course: selectedItem!).id(UUID())
                                    .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                                    .frame(height:200)
                            }
                            
                            
                            
                            
                            soundButton().id(UUID())
                                .padding(.trailing, 70)
                                .padding(.top, 40)
                                .onTapGesture{
                                    withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                            self.textToSpeach("\(selectedItem?.items[correctAnswer].name ?? "".lowercased())")
                                        })
                                    }
                                }
                            
                            CloseButton().id(UUID())
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
                        
                        Button(action: {
                            print("live")
                        }) {
                            Text("Prev").font(.system(size: 44, weight: .bold))
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))   

                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        .padding(.bottom,16)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.yellow)
                                .shadow(color: .orange, radius: 2, x: 0, y: 2)
                        )
                        
                        
                        Button(action: {
                            print("live")
                            self.flagTapped("")
                        }) {
                            Text("Next").font(.system(size: 44, weight: .bold))
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                            
                           
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        .padding(.bottom,16)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.yellow)
                                .shadow(color: .orange, radius: 2, x: 0, y: 2)
                        )
                        
//                        VStack{
//                            LazyVGrid(
//                                columns: [GridItem(),GridItem()],
//                                spacing: 16
//                            ){
//
//                                // if  items != nil {
//                                ForEach(items.indices) { index in
//                                    var item = items[index]
//
//                                    VStack {
//
//                                        if Viewindex == 2 {
//
//                                            TextPlayItemView(item: item)
//                                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
//                                                //  .frame(height: 100)
//                                                .onTapGesture{
//                                                    print("Double tapped!")
//                                                    self.flagTapped(item.name)
//                                                }
//                                        }else{
//                                            Text("\(index)")
//                                            PicturePlayItemView(item: item)
//                                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
//                                                .frame(height: 200)
//                                                .onTapGesture{
//                                                    print("Double tapped!")
//                                                    self.flagTapped(item.name)
//                                                }
//                                        }
//
//
//                                    }.matchedGeometryEffect(id: "container\(item.id)", in: namespace)
//                                }
//                                // }
//
//
//                            }
//                            .padding(16)
//                            .frame(maxWidth:.infinity)
//                            .animation(.some(.linear))
//                        }
//                        .zIndex(1)
                        
                        
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
    fileprivate func basedOnItem() {
        
        
        var allItems =  selectedItem?.items
        
        if let index:Int = allItems!.firstIndex(where: {$0.id == selectedItem!.items[correctAnswer].id }) {
            allItems!.remove(at: index)
        }
        
        let answerIndex = Int.random(in: 0...3)
        allItems!.shuffle()
        
        var _items = [Item]()
        var correctName = selectedItem?.items[correctAnswer]
        for i in 0...3 {
            if answerIndex == i {
                _items.append(correctName!)
                continue
            }
            
            var isItNotdone = true
            while isItNotdone {
                print("...............")
                let optionname = allItems![Int.random(in: 0...allItems!.count-1)]
                
                if optionname.name[0].lowercased() != correctName!.name[0].lowercased() {
                    _items.append(optionname)
                    isItNotdone = false
                }
                //                if
                //                _items.append(allItems![i])
            }
            
        }
        
        
        
        if _items.count == 4 {
            didSetFire = false
            
        }
        
        items.removeAll()
        items = _items
    }
    
    func flagTapped(_ tag : String){
       // if tag == selectedItem?.items[correctAnswer].name {
           // textToSpeach("correct")
            
            
            if selectedItem?.items.count == correctAnswer + 1 {
                return
            }
            
            correctAnswer = correctAnswer + 1
            basedOnItem()
            
            
            //            selectedItem?.items.shuffle()
            //            correctAnswer = Int.random(in: 0...3)
            askQustion()
//        }else{
//
//            textToSpeach("wrong")
//        }
    }
    
    func askQustion(){
        print("we are working on it ")
        DispatchQueue.main.async {
            let name = selectedItem?.items[correctAnswer].name ?? ""
//            var message = ""
//            if Viewindex == 1 {
             let message = name.capitalized
//            }else if Viewindex == 2 {
//                message = "Which one is,\n_____?"
//            }else if Viewindex == 3 {
//                message = "Find it_____"
//            }else{
//                message = "Which one starts with\n the letter, \(name[0].capitalized)?"
//            }
            let qustion = message.replacingOccurrences(of: ",", with: " ", options: NSString.CompareOptions.literal, range:nil)
            self.selectedItem?.title = qustion
            self.selectedItem?.image = name
            
            
            
            if Viewindex == 3 {
                self.textToSpeach("find it, \(name)")
            }else{
                self.textToSpeach(qustion)
            }
            
        }
        //didSetFire = false
    }
    
    func textToSpeach(_ str : String){
        let utterance = AVSpeechUtterance(string: str)
        utterance.pitchMultiplier = 1.5
        utterance.rate = 0.3
        self.speaker.speak(utterance)
    }
}

struct IndividualView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualView()
    }
}


//struct Speaker{
//    var speaker = AVSpeechSynthesizer()
//
//   static func textToSpeach(_ str : String){
//        let utterance = AVSpeechUtterance(string: str)
//        utterance.pitchMultiplier = 1.5
//        utterance.rate = 0.3
//        self.speaker.speak(utterance)
//    }
//}



extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
