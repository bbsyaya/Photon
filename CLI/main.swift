// main.swift
// Copyright (c) 2017 Sam Symons
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import Photon

print("Photon 1.0")

func getPath(fileName: String) -> String {
  let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  let folder = "PhotonRenders"

  return documentURL.appendingPathComponent(folder).appendingPathComponent(fileName).path
}

extension NSImage {
  @discardableResult func saveAsPNG(url: URL) -> Bool {
    guard let tiffData = self.tiffRepresentation else {
      print("Failed to get tiffRepresentation. url: \(url)")
      return false
    }

    let imageRep = NSBitmapImageRep(data: tiffData)

    guard let imageData = imageRep?.representation(using: .PNG, properties: [:]) else {
      print("Failed to get PNG representation. url: \(url)")
      return false
    }

    do {
      try imageData.write(to: url)
      return true
    } catch {
      print("failed to write to disk. url: \(url)")
      return false
    }
  }
}

let statistics = RenderStatistics()
var renderingOptions = RenderingOptions(width: 600, height: 400, statistics: statistics)
let scene = Scene(renderingOptions: renderingOptions)
let path = getPath(fileName: "TestRender.png")

scene.add(object: Sphere(center: Point3D(170, 400 / 2, -150), radius: 125, material: Material.blueMaterial))
scene.add(object: Sphere(center: Point3D(430, 400 / 2, -150), radius: 125, material: Material.blueMaterial))
scene.add(object: Sphere(center: Point3D(300, 400 + 950, -150), radius: 1000, material: Material.blueMaterial))

scene.renderScene { image in
  let unwrappedImage = image!
  unwrappedImage.saveAsPNG(url: URL(fileURLWithPath: path))

  print("Rendering complete after \(scene.renderingOptions.renderStatistics?.elapsedTime ?? 0) seconds")

  exit(0)
}

dispatchMain()
