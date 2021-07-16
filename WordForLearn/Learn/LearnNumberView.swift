//
//  LearnNumberView.swift
//  WordForLearn
//
//  Created by Nazmul on 3/6/21.
//

import SwiftUI


import SwiftUI
import AVFoundation
struct LearnNumberView: View {
    var speaker = AVSpeechSynthesizer()
    @Namespace var namespace
    @State var presentingModal = false
    var items : [String]
    // @State var seletedItem = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            
            VStack(alignment: .leading, spacing:18){
                
                HStack {
                    Text("Number").font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                        .shadow(color: .gray, radius: 2, x: 0, y: 5)
                    Spacer()
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
                        columns: [GridItem()],
                        spacing: 16
                    ){
                        ForEach(items.indices) { index in
                            VStack {
                                LeanNumberItemView(number:numberReturn(items[index]), word: wordReturn(items[index]))
                                    .frame(height: 200)
                                    .onTapGesture{
                                        textToSpeach( numberReturn(items[index]))
                                    }
                            }
                        }
                    }
                    
                    
                    .padding(16)
                    .frame(maxWidth:.infinity)
                }
                .zIndex(1)
                
            }.onAppear {
                
                textToSpeach("Tap on number to learn")
                }
            
        }
        
        //  .animation(.spring())
    }
    
    
    func wordReturn(_ name: String) -> String{
        //34 thirty-four
        
      
        let array = name.split(separator: " ")
       
        
        return String(array[1])
    }
    
    func numberReturn(_ name: String) -> String{
        //34 thirty-four

        let array = name.split(separator: " ")
        return String(array[0])
    }
    
    func textToSpeach(_ str : String){
        speaker.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: str)
        utterance.pitchMultiplier = 1.5
        utterance.rate = 0.3
        self.speaker.speak(utterance)
    }
}

struct LearnNumberView_Previews: PreviewProvider {
    static var previews: some View {
        LearnNumberView(items: [""])
    }
}




