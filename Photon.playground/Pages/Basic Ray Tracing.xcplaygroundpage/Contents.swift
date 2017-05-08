import Foundation
import Photon
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
/*:
 [Previous](@previous)
 ****
 # Basic Ray Tracing

 Photon makes it easy to quickly get up and running with a simple
 ray traced image. To begin, you create an instance of a `Scene`
 object with the size and camera you need. Here, Photon is using
 an orthographic camera, meaning rays are shot out parallel to
 each other.
 
 * Experiment:
 Try using a `PerspectiveCamera` instance to get a more realistic
 image. This renders objects the same way as the human eye would
 perceive them, rather than the same size no matter the distance,
 which is how an orthographic camera works.
 */
var renderingOptions = RenderingOptions(width: 600, height: 400)

let scene = Scene(renderingOptions: renderingOptions)

/*:
 Once you have a `Scene` object, you can add objects to it. Here,
 a `Sphere` is created and added to the scene, with its center as
 the middle of the scene.
 */
let sphereObject = Sphere(center: Point3D(600 / 2, 400 / 2, -100), radius: 150)
scene.add(object: sphereObject)

/*:
 Finally, once you have your scene with objects configured, call
 the `renderScene` function to generate an image. Photon returns
 an optional image here in case anything goes wrong with the
 rendering process, so here we will forcefully unwrap the image
 and hope for the best.
 */
scene.renderScene { image in
  let unwrappedImage = image!
}

//: ****
//: [Next](@next)
