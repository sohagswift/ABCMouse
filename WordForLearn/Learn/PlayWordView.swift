//
//  PlayWordView.swift
//  WordForLearn
//
//  Created by Nazmul on 15/2/21.
//

import SwiftUI
import AVFoundation

struct PlayWordView: View {
   // @State private var isSowingRed = false
    @State private var isShowingNextButton = false
    @State private var word = ""
    @State private var wordCap = ""
    @State private var wordLower = ""
    @State private var wordElement = ""
    @State private var viewPort = 1
    @State private var Alphabetscounter = 0
    @State var presentingModal = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> 
    
    var speaker = AVSpeechSynthesizer()
    fileprivate func defultTopSecton() {
        self.wordCap = WordData.typeWordAlphabets[Alphabetscounter]
        self.wordLower = wordCap.lowercased()
        self.wordElement = ""
        self.word = "\(wordCap)\(wordLower)"
        
        let missingElement = ["gold","umbrella","van","zebra","xerus"]
        for item in  WordData.fruits + missingElement  {
            if item.first?.lowercased() == self.wordLower {
                self.wordElement = item
                break
            }
        }
        
        if self.wordElement.isEmpty{
            for item in  WordData.foods {
                if item.first?.lowercased() == self.wordLower {
                    self.wordElement = item
                    break
                }
            }
        }
        self.textToSpeach(wordLower)
    }
    
    fileprivate func primaryButtonAction() {
        // self.isSowingRed.toggle()
        if  viewPort == 1  {
            self.textToSpeach(wordCap)
            self.word = wordLower
            viewPort = viewPort + 1
            self.isShowingNextButton = false
        }else if viewPort == 2 {
            defultTopSecton()
            self.isShowingNextButton = true
            viewPort = viewPort - 1
        }else if viewPort == 3 {
            self.textToSpeach("\(wordCap), is for, \(wordElement)")
            isShowingNextButton = false
            viewPort = viewPort + 1
        }else if viewPort == 4 {
            defultTopSecton()
            viewPort = viewPort - 1
            isShowingNextButton = true
        }else if viewPort == 5 {
            self.textToSpeach("say,")
            self.textToSpeach("\(wordCap)")
            self.textToSpeach("\(wordLower), \(wordLower)")
            // self.textToSpeach("a")
            isShowingNextButton = false
            viewPort = viewPort + 1
        }else if viewPort == 6 {
            defultTopSecton()
            viewPort = viewPort - 1
            isShowingNextButton = true
        }else if viewPort == 7 {
            //self.textToSpeach("say, a")
            self.textToSpeach("this is, an, \(wordElement)")
            
            isShowingNextButton = false
            viewPort = viewPort + 1
        }else if viewPort == 8 {
            defultTopSecton()
            viewPort = viewPort - 1
            isShowingNextButton = true
        }else if viewPort == 9 {
            //self.textToSpeach("say, a")
            self.textToSpeach("How to write the letter, \(wordCap)")
            self.textToSpeach("\(wordCap)")
            isShowingNextButton = false
            viewPort = viewPort + 1
        }else if viewPort == 10 {
            defultTopSecton()
            viewPort = viewPort - 1
            isShowingNextButton = true
        }else if viewPort == 11 {
            //self.textToSpeach("say, a")
            self.textToSpeach("How to write the letter")
            self.textToSpeach("\(wordLower)")
            isShowingNextButton = false
            viewPort = viewPort + 1
        }else if viewPort == 12 {
            defultTopSecton()
            viewPort = viewPort - 1
            isShowingNextButton = true
        }
    }
    
    fileprivate func nextbuttonOnclickAction() {
        if self.viewPort == 11   {
            Alphabetscounter = Alphabetscounter + 1
            defultTopSecton()
            textToSpeach("this, is the latter, \(wordCap)")
            self.viewPort = 1
            isShowingNextButton = false
        }else{
            self.viewPort =  self.viewPort + 3
        }
        
        if self.viewPort == 4 {
            self.textToSpeach("\(wordCap), is for, \(wordElement)")
            isShowingNextButton = false
        }else if self.viewPort == 6 {
            self.textToSpeach("say,")
            self.textToSpeach("\(wordCap)")
            self.textToSpeach("\(wordLower), \(wordLower)")
            
            isShowingNextButton = false
        }else if self.viewPort == 8 {
            self.textToSpeach("\(wordLower)")
            self.textToSpeach("this is, an, \(wordElement)")
            
            isShowingNextButton = false
        }else if self.viewPort == 10 {
            self.textToSpeach("How to write the letter")
            self.textToSpeach("\(wordCap)")
            isShowingNextButton = false
        }
        else if self.viewPort == 12 {
            self.textToSpeach("How to write the letter")
            self.textToSpeach("\(wordLower)")
            isShowingNextButton = false
        }else{
            //                        NavigationLink(destination: DrawingWrapper(manager: manager, id: doc.id),
            //                        label: { Text("A") })
            //
            //                        NavigationView {
            //                         NavigationLink(destination: DrawingWrapper(imageName: "trace_ca"),
            //                        label: { Text("A") })
            //                        }
            //    self.presentingModal = true
            
            
            
        }
    }
    
    var body: some View {
        
        VStack{
            if isShowingNextButton {
               CloseButton().id(UUID())
                .padding(.trailing, 0)
                .padding(.top, 40)
                .onTapGesture{
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            }
    
                Button(action: {
                    withAnimation{
                        primaryButtonAction()
                    }
                }) {
                    Text(word).font(.system(size: 100, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                )
                .padding(.top,30)
                
             if  viewPort == 2 {
                Image("\(wordLower)").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.scale)
                    .padding(.top,20)
                
            }else if viewPort == 4 {
                    Text("is for").font(.system(size: 50, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                Image(wordElement.replacingOccurrences(of: " ", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                        
                        .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .transition(.scale)
                        .padding(.all,20)
                Text(wordElement.capitalized).font(.system(size: 50, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
            }else if viewPort == 6 {
                Text("\(wordCap) \(wordCap) \(wordCap) \(wordCap)").font(.system(size: 70, weight: .bold))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
               
                Text("\(wordLower) \(wordLower) \(wordLower) ").font(.system(size: 90, weight: .bold))
                    .foregroundColor(.red)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                Text("\(wordLower) \(wordLower) \(wordLower)")
                         .foregroundColor(.blue)
                         .font(Font.custom("SavoyeLetPlain", size: 160))
//                Text("a a a").font(UIFont(name: "SavoyeLetPlain", size: 50))
//                    .padding()
//                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
            }else if viewPort == 8 {
              
                Text("an")
                         .foregroundColor(.blue)
                         .font(Font.custom("SavoyeLetPlain", size: 160))
                Image(wordElement.replacingOccurrences(of: " ", with: "_").lowercased()).resizable().aspectRatio(contentMode: .fit)
                    
                    .frame(maxWidth: .infinity, alignment: .center)
                    .transition(.scale)
                    .padding(.all,20)
                
                Text(wordElement)
                         .foregroundColor(.blue)
                         .font(Font.custom("SavoyeLetPlain", size: 120))

                
            }else if viewPort == 10 {
                
                Text("Trace the Letter")
                    .font(.system(size: 40, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                Image("trace_c\(wordLower)").resizable().aspectRatio(contentMode: .fit)
                    
                    .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.scale)
                    .padding(.all,20)
                
               
                
            }else if viewPort == 12 {
                
                Text("Trace the Letter")
                    .font(.system(size: 40, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                Image("trace_\(wordLower)").resizable().aspectRatio(contentMode: .fit)
                    
                    .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.scale)
                    .padding(.all,20)
                
               
                
            }
                
//            }else {
//
//
//            }
            
            if isShowingNextButton {
                Spacer()
                Button(action: {
                    nextbuttonOnclickAction()
                }) {
                    Text("Next").font(.system(size: 44, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                    
                   
                    
                }
                .buttonStyle(PlainButtonStyle())
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.leading,10)
                .padding(.trailing,10)
                //.padding(.bottom,16)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.yellow)
                        .shadow(color: .orange, radius: 2, x: 0, y: 2)
                )
//                .fullScreenCover(isPresented: $presentingModal) {
//                    NavigationView {
//                        DrawingWrapper(imageName: "trace_ca")
//                            .toolbar {
//                                ToolbarItem(placement: .navigationBarTrailing) {
//                                    Button(action: {
//                                        presentingModal = false
//                                    }, label: {
//                                        Text("Dismiss")
//                                    })
//                                }
//                            }
//                    }
//                }
//                .sheet(isPresented: $presentingModal, onDismiss: {
//                    print("Code executed when the sheet dismisses")
//                }) {
//                             DrawingWrapper(imageName: "trace_ca")
//                        }
                
            }
            
            
        }.onAppear {
            defultTopSecton()
            textToSpeach("this, is the latter, \(wordCap)")
        }
        
    }
    
    func textToSpeach(_ str : String){
        speaker.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: str)
        utterance.pitchMultiplier = 1.3
        utterance.rate = 0.4
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        self.speaker.speak(utterance)
    }
}

struct PlayWordView_Previews: PreviewProvider {
    static var previews: some View {
        PlayWordView()
    }
}
