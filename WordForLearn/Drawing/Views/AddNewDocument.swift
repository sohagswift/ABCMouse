///**
/**

DrawingDocApp
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/10/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct AddNewDocument: View {
    @ObservedObject var manager: DrawingManager
    @State private var documentName: String = ""
    @Binding var addShown: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack(alignment: .leading)  {
            
            CloseButton()
                .padding(.bottom, 16)
                .onTapGesture{
                                                 self.presentationMode.wrappedValue.dismiss()
                                             }
            
            Text("Enter Drawing name:")
            
            TextField("Enter drawing name here...", text: $documentName, onCommit: {
                save(fileName: documentName)
            })
            .frame(height: 44)
            //           .textFieldStyle(PlainTextFieldStyle())
           .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.all)
            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
            
         
            RoundedButton()
                .padding(.trailing, 16)
                .onTapGesture{
                    save(fileName: documentName)
                                             }
        }.padding(.horizontal, 15)
    }
    
    private func save(fileName: String) {
        manager.addData(doc: DrawingDocument(id: UUID(), data: Data(), name: fileName))
        addShown.toggle()
    }
}



