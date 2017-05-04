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

let redPixel = PixelData(r: 255, g: 0, b: 0)
let redImageData = [PixelData](repeating: redPixel, count: 200 * 200)
let redImage = Image.image(from: redImageData, width: 200, height: 200)

let greenPixel = PixelData(r: 0, g: 255, b: 0)
let greenImageData = [PixelData](repeating: greenPixel, count: 200 * 200)
let greenImage = Image.image(from: greenImageData, width: 200, height: 200)

let bluePixel = PixelData(r: 0, g: 0, b: 255)
let blueImageData = [PixelData](repeating: bluePixel, count: 200 * 200)
let blueImage = Image.image(from: blueImageData, width: 200, height: 200)

//:  ****
//:  [Next](@next)
