//
//  LearnColorView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 2/6/21.
//

import SwiftUI

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
import AVFoundation
struct LearnColorView: View {
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
                    Text("speach201".localizedStringForKey()).font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
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
                                LeanColorItemView(course: items[index],imageName:colorReturn(name:  items[index]))
                                    .frame(height: 200)
                                    .onTapGesture{
                                        textToSpeach( items[index])
                                    }
                            }
                        }
                    }
                    
                    
                    .padding(16)
                    .frame(maxWidth:.infinity)
                }
                .zIndex(1)
                
            }.onAppear {
                
                textToSpeach("speach202".localizedStringForKey())
                }
            
        }
        
        //  .animation(.spring())
    }
    
    
    func colorReturn(name: String) -> UIColor{
        
        var color = UIColor()
        
        
        switch name {
        
        case "magenta":
            
            color = .magenta
            
        case "yellow":
            color = .yellow
            
            
        case "blue":
            
            color = .blue
            
            
        case "orange":
            color = .orange
            
            
        case "green":
            color = .green
            
            
        case "white":
            color = .white
            
            
        case "red":
            color = .red
            
            
        case "purple":
            color = .purple
            
            
        case "cyan":
            color = .cyan
            
            
        case "brown":
            color = .brown
            
            
        case "peace":
            // peace
            color = UIColor.rgb(255, green: 229, blue: 180)
            
        case "silver":
            // silver
            color = UIColor.rgb(192, green: 192, blue: 192)
            
        case "gold":
            // gold
            color = UIColor.rgb(255, green: 215, blue: 0)
            
        case "lime":
            // lime
            color = UIColor.rgb(192, green: 255, blue: 0)
            
        case "pink":
            // pink
            
            color = UIColor.rgb(255, green: 1, blue:128)
            
        case "teal":
            // teal
            color = UIColor.rgb(0, green: 128, blue: 128)
            
        case "lavender":
            // lavender
            color = UIColor.rgb(230, green: 230, blue: 250)
            
        case "navy":
            // navy
            color = UIColor.rgb(0, green: 0, blue: 128)
            
        case "beige":
            // beige
            color = UIColor.rgb(245, green: 245, blue: 220)
            
            
        case "maroon":
            // maroon
            color = UIColor.rgb(128, green: 0, blue: 0)
            
        case "mint":
            // mint
            color = UIColor.rgb(170, green: 255, blue: 195)
            
        case "olive":
            // olive
            color = UIColor.rgb(128, green: 128, blue: 0)
            
        case "coral":
            // coral
            color = UIColor.rgb(255, green: 127, blue: 80)
            
        case "darkGray":
            
            color = .darkGray
            
        case "gray":
            
            color = .gray
            
        case "lightGray":
            
            color = .lightGray
            
        case "black":
            
            color = .black
            
        default:
            color = UIColor.rgb(85, green: 169, blue: 248)
        }
        return color
    }
    
    func textToSpeach(_ str : String){
//        speaker.stopSpeaking(at: .immediate)
//        let utterance = AVSpeechUtterance(string: str)
//        utterance.pitchMultiplier = 1.5
//        utterance.rate = 0.3
//        self.speaker.speak(utterance)
        SpeckLife.textToSpeach(str, stopSpeaking: true, speaker: speaker)
    }
}

struct LearnColorView_Previews: PreviewProvider {
    static var previews: some View {
        LearnColorView(items: [""])
    }
}



extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func rgba(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
