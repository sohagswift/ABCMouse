///**
/**
 
 DrawingDocApp
 CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/10/20
 COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC
 
 */

import UIKit
import PencilKit

class DrawingViewController: UIViewController {
    
    var imageName : String?
    
    lazy var canvas: PKCanvasView =  {
        let v = PKCanvasView()
        v.drawingPolicy = .anyInput
        v.minimumZoomScale = 1
        v.maximumZoomScale = 2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var toolPicker: PKToolPicker = {
        let toolPicker = PKToolPicker()
        toolPicker.addObserver(self)
        return toolPicker
    }()
    
    var drawingData = Data()
    
    var drawingChanged: (Data) -> Void = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        
        NSLayoutConstraint.activate([
            canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvas.topAnchor.constraint(equalTo: view.topAnchor),
            canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        toolPicker.setVisible(true, forFirstResponder: canvas)
        toolPicker.addObserver(canvas)
        canvas.delegate = self
        canvas.becomeFirstResponder()
        
        
        //        var imagedata = UIImage(named: "trace_a")
        //        canvas.largeContentImage = imagedata
        
        canvas.backgroundColor = .clear
        canvas.isOpaque = false
        canvas.maximumZoomScale = 5
        canvas.minimumZoomScale = 1
        
        if let name = imageName {
            let imageView = UIImageView(image: UIImage(named: name)?.resizeImage(targetSize: CGSize(width: self.view.frame.width - 40, height:  self.view.frame.width - 40)))
            let contentView = Tool.getContentViewFromPkCanvasView(canvas)
            contentView.addSubview(imageView)
            contentView.sendSubviewToBack(imageView)
            imageView.center = CGPoint(
                x:  self.view.frame.size.width  / 2,
                y: self.view.frame.size.height / 2.5 -  (self.view.frame.size.height/10)
            ) //self.view.center
        }else if let drawing = try? PKDrawing(data: drawingData) {
            canvas.drawing = drawing
           
        }

    }
}

// MARK:- PK Delegates
extension DrawingViewController: PKToolPickerObserver, PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        drawingChanged(canvasView.drawing.dataRepresentation())
    }
}


class Tool{
    static func getContentViewFromPkCanvasView(_ view: UIView) -> some UIView {
        return view.subviews[0]
    }
}


import UIKit
extension UIImage {
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
  }
}
