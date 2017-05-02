// Scene.swift
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

public typealias SceneRenderingCompletion = ((_ image: ImageType?) -> Void)

public final class Scene {
  private var geometricObjects: [GeometricObject] = []

  public var objects: [GeometricObject] {
    return geometricObjects
  }


  // MARK: - Public Functions

  public func add(object: GeometricObject) {
    geometricObjects.append(object)
  }

  public func add(objects objectArray: [GeometricObject]) {
    geometricObjects.append(contentsOf: objectArray)
  }

  public func renderScene(completion: SceneRenderingCompletion) {
    guard objects.count > 0 else { completion(nil); return }

    let pixel = PixelData(r: 255, g: 0, b: 0)
    let imageData = [PixelData](repeating: pixel, count: 200 * 200)
    let image = Image.image(from: imageData, width: 200, height: 200)

    completion(image)
  }
}
