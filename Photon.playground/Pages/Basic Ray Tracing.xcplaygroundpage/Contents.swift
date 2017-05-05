//: [Previous](@previous)

import Foundation
import Photon
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let scene = Scene(width: 300, height: 200, camera: OrthographicCamera())

scene.add(object: Sphere(center: Point3D(300 / 2, 200 / 2, -50), radius: 60))
scene.renderScene { image in
  let unwrappedImage = image!
}

//: [Next](@next)
