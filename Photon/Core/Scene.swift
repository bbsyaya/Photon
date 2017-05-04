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
  private let integrator: Integrator
  private let callbackQueue: DispatchQueue
  private let renderQueue = DispatchQueue(label: "com.photon.image-rendering", qos: .userInitiated, attributes: [.concurrent], target: nil)


  // MARK: - Initialization

  public init(width: Int, height: Int, camera: Camera, integrator: Integrator = BasicIntegrator(), callbackQueue: DispatchQueue = DispatchQueue.main) {
    self.pixelBuffer = Buffer(width: width, height: height)
    self.camera = camera
    self.integrator = integrator
    self.callbackQueue = callbackQueue
  }


  // MARK: - Public Functions

  public func add(object: GeometricObject) {
    geometricObjects.append(object)
  }

  public func add(objects objectArray: [GeometricObject]) {
    geometricObjects.append(contentsOf: objectArray)
  }

  public func renderScene(_ sceneCompletion: @escaping SceneRenderingCompletion) {
    guard objects.count > 0 else { sceneCompletion(nil); return }

    for column in 0 ..< width {
      for row in 0 ..< height {
        let ray = camera.castRayAt(x: Float(column), y: Float(row))
        let color = integrator.trace(ray: ray, depth: 0)
        pixelBuffer[(column, row)] = color
      }
    }

    let image = Image.image(from: pixelBuffer.pixelData, width: width, height: height)

    callbackQueue.async {
      sceneCompletion(image)
    }
  }
}
