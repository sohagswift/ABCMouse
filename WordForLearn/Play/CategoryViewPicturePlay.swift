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
    var title = "KidS WOrLd"
    @State  var correctAnswer = 0
    @State  var items =  [Item]()
    @State var show = false
    @State var showPurchase = false
    @Binding var fromHome : Bool
    @StateObject var storeManager: StoreManager
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
        
        
        VStack{
            
            if !show {
            HStack {
                Text(title).font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .shadow(color: .gray, radius: 2, x: 0, y: 5)
                Spacer()
                CloseButton()
                    .padding(.trailing, 16)
                    .onTapGesture{
                        self.fromHome = false
                                                    // self.presentationMode.wrappedValue.dismiss()
                        }
                
            }.background(Image("Certificate3")
                            .resizable()
                            .scaledToFill())
            }
            
            
        ZStack{
            

           
            ScrollView{
                
                
                
                VStack(alignment: .leading, spacing:18){
                    
            
                    
                  
                    ForEach(WordData.getCategorItem(Viewindex:Viewindex)) { item in
                        CategoryItemSection(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(height: 230)
                            .padding(.trailing, 16)
                            .padding(.leading, 16)
                            .onTapGesture{
                                withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                                    
                                    if !storeManager.isPurchase(){
                                       // outgoingCardPresent = true
                                        showPurchase = true
                                        return
                                        //return AnyView(StoreBuyView(isPresented: $outgoingCardPresent,storeManager: storeManager))
                                    }
                                    show.toggle()
                                    correctAnswer = 0
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
            .fullScreenCover(isPresented: self.$showPurchase) {
             
                ParentPermisionView(isForReview: .constant(false), isPresented: $showPurchase,storeManager: storeManager)

            }

            
            if selectedItem != nil {
                VStack(){
                ScrollView {
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                       
                       // FromTextToImageQustionView(course: selectedItem!)
                        
                        if Viewindex == 2 || Viewindex == 4  {
                            ImageToTextQustionView(course: selectedItem!).id(UUID())
                           .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                           .frame(height:400)
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
                                    self.textToSpeach(speckingMessgae)
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
                            
                           // if  items != nil {
                            ForEach(items.indices) { index in
                                var item = items[index]
                                  
                                    VStack {
                                       
                                        if Viewindex == 2 || Viewindex == 4  {
                                            
                                            TextPlayItemView(item: item)
                                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                              //  .frame(height: 100)
                                                .animation(.interpolatingSpring(stiffness: 1, damping: 1)) //animation
                                            .onTapGesture{
                                                print("Double tapped!")
                                                self.flagTapped(item.name)
                                            }
                                        }else{
                                           // Text("\(index)")
                                            PicturePlayItemView(item: item)
                                                
                                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                                .frame(height: 200)
                                                .animation(.interpolatingSpring(stiffness: 1, damping: 1)) //animation
                                            .onTapGesture{
                                                print("Double tapped!")
                                                self.flagTapped(item.name)
                                                    
                                            }
                                        
                                        }
                                            
                                       
                                    }.matchedGeometryEffect(id: "container\(item.id)", in: namespace)
                                }
                           // }
                            
                        
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
        
        if Viewindex == 4 {
            for  i in _items {
                items.append(Item(name:i.name[0]))
            }
        }else{
            items = _items
        }
        
       // items = _items
    }
    
    
    @State var sound: AVAudioPlayer!


    func playSound(filename :String ) {

            if let path = Bundle.main.path(forResource: filename, ofType: "wav") {
                do {
                    sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    print("Playing sound")
                    sound.play()
                } catch {
                    print( "Could not find file")
                }
            }
        }

    func flagTapped(_ tag : String){
        if tag == selectedItem?.items[correctAnswer].name || (Viewindex == 4 && tag == selectedItem?.items[correctAnswer].name[0..<1] )  {
            //textToSpeach("correct")
            playSound(filename:"correct" )
            
            if selectedItem?.items.count == correctAnswer + 1 {
                playSound(filename:"correct2" )
                self.presentationMode.wrappedValue.dismiss()
                return
            }
          
            correctAnswer = correctAnswer + 1
             basedOnItem()
           
            
//            selectedItem?.items.shuffle()
//            correctAnswer = Int.random(in: 0...3)
             askQustion()
        }else{
        
            if Viewindex == 0 {
                textToSpeach(tag + ", starts with , \(tag[0])")
            }else if Viewindex == 4 {
                textToSpeach("wrong")
            }else {
                textToSpeach(tag)
            }
           
        }
    }
    
    @State var speckingMessgae = ""
     func askQustion(){
       print("we are working on it ")
        DispatchQueue.main.async {
            let name = selectedItem?.items[correctAnswer].name ?? ""
            var message = ""
            if Viewindex == 1 {
                message = "Which one\nis, \(name.capitalized)?"
            }else if Viewindex == 2 {
                message = "Which one is,\n_____?"
            }else if Viewindex == 3 {
                message = "Find it_____"
            }
            else if Viewindex == 4 {
                message = "Find the mising letter _\(String(name.dropFirst()))"
            }
            else{
                message = "Which one starts with\n the letter, \(name[0].capitalized)?"
            }
             speckingMessgae = message.replacingOccurrences(of: ",", with: " ", options: NSString.CompareOptions.literal, range:nil)
            self.selectedItem?.title = speckingMessgae
            self.selectedItem?.image = name
            
            
            
           if Viewindex == 3 {
            speckingMessgae = "find it, \(name)"
           } else if Viewindex == 4{
            speckingMessgae = "Find the mising letter"
           }
            
            self.textToSpeach(speckingMessgae)
            
        }
        //didSetFire = false
    }
    
    func textToSpeach(_ str : String){
      
        speaker.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: str)
        utterance.pitchMultiplier = 1.5
        utterance.rate = 0.3
        self.speaker.speak(utterance)
    }
}

//struct CategoryViewPicturePlay_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryViewPicturePlay()
//    }
//}



