///**
/**

DrawingDocApp
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/10/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct DrawingWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = DrawingViewController
    var imageName : String?
    var manager: DrawingManager?
    var id: UUID?
    @State var presentingModal = false
    func makeUIViewController(context: Context) -> DrawingViewController {
        let viewController = DrawingViewController()
        
        if imageName != nil {
             viewController.imageName = imageName
        }else if let manager = manager, let id = id  {
              viewController.drawingData = manager.getData(for: id)
             viewController.drawingChanged = { data in
                 manager.update(data: data, for: id)
             }
        }
     
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: DrawingViewController, context: Context) {
        if let manager = manager, let id = id  {
            uiViewController.drawingData = manager.getData(for: id)
        }
       
    }
}
