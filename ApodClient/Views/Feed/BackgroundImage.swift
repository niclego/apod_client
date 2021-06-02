//
//  ApodBackgroundImage.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct BackgroundImage: View {
    @ObservedObject var apodObj: ApodObj
    @State private var backgroundColor: Color = .clear

    var body: some View {
        WebImage(url: URL(string: self.apodObj.apod.hdurl ?? self.apodObj.apod.url))
            .placeholder(Image(systemName: "arrow.triangle.2.circlepath"))
            .resizable()
            .aspectRatio(contentMode: apodObj.imageIsExpanded ? .fill : .fit)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .blur(radius: apodObj.showExplanation ? 10 : 0)
            .animation(.linear(duration: 0.4))
            .background(backgroundColor)
            .ignoresSafeArea()
//            .onAppear {
//                print("hello")
//                self.setAverageColor()
//            }
            .onChange(of: apodObj.apod.url) { _ in
                if !apodObj.imageIsExpanded {
                    self.setAverageColor()
                }
            }

    }
    
    private func setAverageColor() {
        do {
            let imageUrlString = self.apodObj.apod.url
                guard let imageUrl = URL(string: imageUrlString) else { return  }
                
                let imageData = try! Data(contentsOf: imageUrl)
                
                let image = UIImage(data: imageData)
                
                let uiColor = image?.averageColor ?? .yellow
                backgroundColor = Color(uiColor)
                print("Success! Yum.")
            
            


        } catch {
            print("Unexpected error: \(error).")
        }
        

    }
    
}

extension UIImage {
    /// Average color of the image, nil if it cannot be found
    var averageColor: UIColor? {
        // convert our image to a Core Image Image
        guard let inputImage = CIImage(image: self) else { return nil }
        
        // Create an extent vector (a frame with width and height of our current input image)
        let extentVector = CIVector(x: inputImage.extent.origin.x,
                                    y: inputImage.extent.origin.y,
                                    z: inputImage.extent.size.width,
                                    w: inputImage.extent.size.height)
        
        // create a CIAreaAverage filter, this will allow us to pull the average color from the image later on
        guard let filter = CIFilter(name: "CIAreaAverage",
                                    parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }
        
        // A bitmap consisting of (r, g, b, a) value
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        
        // Render our output image into a 1 by 1 image supplying it our bitmap to update the values of (i.e the rgba of the 1 by 1 image will fill out bitmap array
        context.render(outputImage,
                       toBitmap: &bitmap,
                       rowBytes: 4,
                       bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
                       format: .RGBA8,
                       colorSpace: nil)
        
        // Convert our bitmap images of r, g, b, a to a UIColor
        return UIColor(red: CGFloat(bitmap[0]) / 255,
                       green: CGFloat(bitmap[1]) / 255,
                       blue: CGFloat(bitmap[2]) / 255,
                       alpha: CGFloat(bitmap[3]) / 255)
    }
}
