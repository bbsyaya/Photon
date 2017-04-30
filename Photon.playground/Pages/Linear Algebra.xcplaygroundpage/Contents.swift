/*:
 [Previous](@previous)
 ****
 # Linear Algebra
 
 At the heart of the ray tracing process is linear algebra. Vectors and matrices
 provide the mathematical basis of ray tracing by allowing you to easily and
 efficiently represent rays and perform calculations on them.
 
 Photon uses two structs for calculating with vectors: `Vector2D` and `Vector3D`.
 It's easy to calculate the sum of two vectors, for example:
 */

import Foundation
import PlaygroundSupport
import Photon

let v1 = Vector2D(1.0, 2.0)
let v2 = Vector2D(3.0, 4.0)

let vectorAddition = v1 + v2

let vectorVisualization = VectorVisualizationView(vectors: [v1, v2])
PlaygroundPage.current.liveView = vectorVisualization

//:  ****
//:  [Next](@next)
