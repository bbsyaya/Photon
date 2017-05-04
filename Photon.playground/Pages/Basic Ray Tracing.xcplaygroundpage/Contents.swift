//: [Previous](@previous)

import Foundation
import Photon
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let scene = Scene(width: 150, height: 150 , camera: OrthographicCamera())

scene.add(object: Plane(point: Point3D.zero, normal: Normal(0, 0, -1)))
scene.renderScene { image in
  let unwrappedImage = image!

  let pixel = PixelData(r: 255, g: 0, b: 0)
  let imageData = [PixelData](repeating: pixel, count: 150 * 150)
  let image = Image.image(from: imageData, width: 150, height: 150)
}



//: [Next](@next)
