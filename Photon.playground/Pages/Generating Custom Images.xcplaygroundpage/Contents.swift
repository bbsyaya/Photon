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
let imageData = [PixelData](repeating: pixel, count: 100 * 100)
let image = Image.image(from: imageData, width: 100, height: 100)

let imageView = NSImageView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
imageView.image = image

PlaygroundPage.current.liveView = imageView
//:  ****
//:  [Next](@next)
