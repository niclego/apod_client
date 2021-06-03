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
            .background(backgroundColor)
            .ignoresSafeArea()
            .onChange(of: apodObj.apod.url) { _ in
                self.setAverageColor()
            }

    }
    
    private func setAverageColor() {
        let imageUrlString = self.apodObj.apod.url
        guard let imageUrl = URL(string: imageUrlString) else { return }
        do {
            let imageData = try Data(contentsOf: imageUrl)
            let image = UIImage(data: imageData)
            let uiColor = image?.averageColor ?? .yellow
            backgroundColor = Color(uiColor)
            
            withAnimation {
                apodObj.showExplanation = false
            }
        } catch {
            print(error)
            return
        }
    }
}

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x,
                                    y: inputImage.extent.origin.y,
                                    z: inputImage.extent.size.width,
                                    w: inputImage.extent.size.height)
        
        guard let filter = CIFilter(name: "CIAreaAverage",
                                    parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        context.render(outputImage,
                       toBitmap: &bitmap,
                       rowBytes: 4,
                       bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
                       format: .RGBA8,
                       colorSpace: nil)
        return UIColor(red: CGFloat(bitmap[0]) / 255,
                       green: CGFloat(bitmap[1]) / 255,
                       blue: CGFloat(bitmap[2]) / 255,
                       alpha: CGFloat(bitmap[3]) / 255)
    }
}
