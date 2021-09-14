//
//  LanguageSetting.swift
//  WordForLearn
//
//  Created by MacBook Air M1 on 17/7/21.
//

import SwiftUI


//
//  ModalView.swift
//  WordForLearn
//
//  Created by MacBook Air M1 on 6/7/21.
//

import SwiftUI




struct LanguageModalView : View {
    @Binding var isPresented : Bool
    
    @State var restart : Bool = false
    
 
  //  @State var set = "Round_1"
    @State private var optionChosed = 0
    @ObservedObject var viewModel = ListViewModel()
   
    var  data = ["English","عربى"]
    var  unicode =  ["en","ar"]
    
    @Environment(\.presentationMode) var  present
    
    @State var slectedindex =  -1
    
    func color(option : Int)-> Color{
        
        // TStorage.wordFocus = unicode[index]
        if TStorage.wordFocus == unicode[option] {

                return Color.blue

        }else{

           return Color.gray
        }
    }

    
    
    //    @State var correct : Int = 0
    //    @State var wrong : Int = 0
    //    @State var answared : Int = 0
    
    var body: some View {
        
        ZStack{
        VStack{
            
        /*
             LounchAppView
             */

            Text("speach206".localizedStringForKey())
                .font(.headline)
                .fontWeight(.light)
                .foregroundColor(.black)
                .padding(.top,20)
                .multilineTextAlignment(.center)
            
            if TStorage.isFastTimeRun != 0{
            Text("speach207".localizedStringForKey())
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .padding(.top,10)
                .multilineTextAlignment(.center)
            }
            Spacer(minLength: 10)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2),spacing:30, content: {
                
                ForEach(data.indices){ index in
                    VStack(spacing:15){
//                        Image(data[index].replacingOccurrences(of: " ", with: "_").lowercased()).resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 150)
                        Text(data[index].capitalized)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                             
                            
                        
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(color(option: index),lineWidth: 1)
                    )
                   
                    .onTapGesture {
                      
                       
                        TStorage.wordFocus = unicode[index]
                        
                        Bundle.setLanguage(TStorage.wordFocus)
                        
                        if TStorage.isFastTimeRun == 0 {
                            TStorage.isFastTimeRun = 1
                            restart = true
                           
                        }else{
//                            isPresented = false
                            self.present.wrappedValue.dismiss()
                        }
                       
                    
                    }
                    
                }
                
                
                //.frame(maxWidth: .infinity)
                .padding(.all,20)
                .background(Color.lightBackground)
                .cornerRadius(15)
                
            })
            
            HStack{
                
                refreshdButton()
                    
                    .onTapGesture{
                        withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                            self.present.wrappedValue.dismiss()
                        }
                    }
            }.padding([.top], 20)
            
            Spacer(minLength: 0)
                .padding()
        }
        .fullScreenCover(isPresented: self.$restart) {
         
            LounchAppView().environment(\.locale, Locale(identifier:
                                                            TStorage.wordFocus))

        }
       }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView(content: WordData.getCategorItem().first!)
//    }
//}
