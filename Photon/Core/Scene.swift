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
  public var objects: [GeometricObject] {
    return geometricObjects
  }

  public var width: Int {
    return pixelBuffer.width
  }

  public var height: Int {
    return pixelBuffer.height
  }

  private var geometricObjects: [GeometricObject] = []
  private let pixelBuffer: Buffer
  private let camera: Camera
  private let renderer: Renderer
  private let callbackQueue: DispatchQueue
  private let renderQueue = DispatchQueue(label: "com.photon.image-rendering", qos: .userInitiated, attributes: [.concurrent], target: nil)


  // MARK: - Initialization

  public init(renderingOptions: RenderingOptions) {
    self.pixelBuffer = Buffer(width: renderingOptions.width, height: renderingOptions.height)
    self.camera = renderingOptions.camera
    self.callbackQueue = renderingOptions.callbackQueue

    self.renderer = Renderer()
  }


  // MARK: - Public Functions

  public func add(object: GeometricObject) {
    geometricObjects.append(object)
    renderer.geometricObjects = geometricObjects
  }

  public func add(objects objectArray: [GeometricObject]) {
    geometricObjects.append(contentsOf: objectArray)
    renderer.geometricObjects = geometricObjects
  }

  public func renderScene(_ sceneCompletion: @escaping SceneRenderingCompletion) {
    guard objects.count > 0 else { sceneCompletion(nil); return }

    for row in 0 ..< height {
      for column in 0 ..< width {
        let ray = camera.castRayAt(x: Float(column), y: Float(row))
        let color = renderer.trace(ray: ray, depth: 0)
        pixelBuffer[(row, column)] = color
      }
    }

    let image = Image.image(from: pixelBuffer.pixelData, width: width, height: height)

    callbackQueue.async {
      sceneCompletion(image)
    }
  }
}
