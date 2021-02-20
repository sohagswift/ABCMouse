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
    @State private var word = "Aa"
    @State private var viewPort = 1
    @State var presentingModal = false
    var speaker = AVSpeechSynthesizer()
    fileprivate func defultTopSecton() {
        self.word = "Aa"
        self.textToSpeach("a")
    }
    
    var body: some View {
        
        VStack{
            
         //   if viewPort == 0 {
                Button(action: {
                    withAnimation{
                       // self.isSowingRed.toggle()
                        if  viewPort == 1  {
                            self.textToSpeach("A")
                            self.word = "a"
                            viewPort = viewPort + 1
                            self.isShowingNextButton = false
                        }else if viewPort == 2 {
                            defultTopSecton()
                            self.isShowingNextButton = true
                            viewPort = viewPort - 1
                        }else if viewPort == 3 {
                            self.textToSpeach("A, is for, apple")
                            isShowingNextButton = false
                            viewPort = viewPort + 1
                        }else if viewPort == 4 {
                            defultTopSecton()
                            viewPort = viewPort - 1
                            isShowingNextButton = true
                        }else if viewPort == 5 {
                            self.textToSpeach("say,")
                            self.textToSpeach("A")
                            self.textToSpeach("a, a")
                           // self.textToSpeach("a")
                            isShowingNextButton = false
                            viewPort = viewPort + 1
                        }else if viewPort == 6 {
                            defultTopSecton()
                            viewPort = viewPort - 1
                            isShowingNextButton = true
                        }else if viewPort == 7 {
                            //self.textToSpeach("say, a")
                            self.textToSpeach("this is, an, apple")
                           
                            isShowingNextButton = false
                            viewPort = viewPort + 1
                        }else if viewPort == 8 {
                            defultTopSecton()
                            viewPort = viewPort - 1
                            isShowingNextButton = true
                        }else if viewPort == 9 {
                            //self.textToSpeach("say, a")
                            self.textToSpeach("How to write the letter, A")
                            self.textToSpeach("A")
                            isShowingNextButton = false
                            viewPort = viewPort + 1
                        }else if viewPort == 10 {
                            defultTopSecton()
                            viewPort = viewPort - 1
                            isShowingNextButton = true
                        }else if viewPort == 11 {
                            //self.textToSpeach("say, a")
                            self.textToSpeach("How to write the letter")
                            self.textToSpeach("a")
                            isShowingNextButton = false
                            viewPort = viewPort + 1
                        }else if viewPort == 12 {
                            defultTopSecton()
                            viewPort = viewPort - 1
                            isShowingNextButton = true
                        }
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
                Image("a").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.scale)
                    .padding(.top,20)
                
            }else if viewPort == 4 {
                    Text("is for").font(.system(size: 50, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                    Image("apple").resizable().aspectRatio(contentMode: .fit)
                        
                        .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .transition(.scale)
                        .padding(.all,20)
                    Text("Apple").font(.system(size: 50, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
            }else if viewPort == 6 {
                Text("A A A A").font(.system(size: 70, weight: .bold))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
               
                Text("a a a ").font(.system(size: 90, weight: .bold))
                    .foregroundColor(.red)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                Text("a a a")
                         .foregroundColor(.blue)
                         .font(Font.custom("SavoyeLetPlain", size: 160))
//                Text("a a a").font(UIFont(name: "SavoyeLetPlain", size: 50))
//                    .padding()
//                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
            }else if viewPort == 8 {
              
                Text("an")
                         .foregroundColor(.blue)
                         .font(Font.custom("SavoyeLetPlain", size: 160))
                Image("apple").resizable().aspectRatio(contentMode: .fit)
                    
                    .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.scale)
                    .padding(.all,20)
                
                Text("apple")
                         .foregroundColor(.blue)
                         .font(Font.custom("SavoyeLetPlain", size: 160))

                
            }else if viewPort == 10 {
                
                Text("Trace the Letter")
                    .font(.system(size: 40, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                Image("trace_ca").resizable().aspectRatio(contentMode: .fit)
                    
                    .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.scale)
                    .padding(.all,20)
                
               
                
            }else if viewPort == 12 {
                
                Text("Trace the Letter")
                    .font(.system(size: 40, weight: .bold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
                Image("trace_a").resizable().aspectRatio(contentMode: .fit)
                    
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
                    self.viewPort =  self.viewPort + 3
                    if self.viewPort == 4 {
                        self.textToSpeach("A, is for, apple")
                        isShowingNextButton = false
                    }else if self.viewPort == 6 {
                        self.textToSpeach("say,")
                        self.textToSpeach("A")
                        self.textToSpeach("a, a")
                       
                        isShowingNextButton = false
                    }else if self.viewPort == 8 {
                        self.textToSpeach("a")
                        self.textToSpeach("this is, an, apple")
                        
                        isShowingNextButton = false
                    }else if self.viewPort == 10 {
                        self.textToSpeach("How to write the letter")
                        self.textToSpeach("A")
                        isShowingNextButton = false
                    }
                    else if self.viewPort == 12 {
                        self.textToSpeach("How to write the letter")
                        self.textToSpeach("a")
                        isShowingNextButton = false
                    }else{
//                        NavigationLink(destination: DrawingWrapper(manager: manager, id: doc.id),
//                        label: { Text("A") })
                        
//                        NavigationView {
//                         NavigationLink(destination: DrawingWrapper(imageName: "trace_ca"),
//                        label: { Text("A") })
//                        }
                        self.presentingModal = true
                        
                          
                      
                    }
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
                .fullScreenCover(isPresented: $presentingModal) {
                    NavigationView {
                        DrawingWrapper(imageName: "trace_ca")
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
//                .sheet(isPresented: $presentingModal, onDismiss: {
//                    print("Code executed when the sheet dismisses")
//                }) {
//                             DrawingWrapper(imageName: "trace_ca")
//                        }
                
            }
            
            
        }.onAppear {
            textToSpeach("this, is the latter, A")
        }
        
    }
    
    func textToSpeach(_ str : String){
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
