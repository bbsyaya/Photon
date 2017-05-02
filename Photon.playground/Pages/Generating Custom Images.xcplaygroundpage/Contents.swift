/*:
 [Previous](@previous)
 ****
 # Generating Custom Images

 Photon includes an `Image` struct used for generating custom images.
 It abstracts away usage of CGImage behind a simple `PixelData` struct,
 which includes RGBA values. From there, you can pass an array of
 `PixelData` objects to `Image` which will generate either an `NSImage`
 or `UIImage`, depending on your platform.
 
 Here's how you can generate a simple, single-color image:
 */
import Foundation
import PlaygroundSupport
import Photon

let pixel = PixelData(r: 255, g: 0, b: 0)
let imageData = [PixelData](repeating: pixel, count: 200 * 200)
let image = Image.image(from: imageData, width: 200, height: 200)

//:  ****
//:  [Next](@next)
