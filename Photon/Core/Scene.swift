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

  let renderingOptions: RenderingOptions

  private var geometricObjects: [GeometricObject] = []
  private let pixelBuffer: Buffer
  private let camera: Camera
  private let renderer: Renderer
  private let callbackQueue: DispatchQueue
  private let renderQueue = DispatchQueue(label: "com.photon.image-rendering", qos: .userInitiated, attributes: .concurrent, target: nil)
  private let writeQueue = DispatchQueue(label: "com.photon.image-writing", qos: .userInitiated, attributes: [], target: nil)
  private let renderGroup = DispatchGroup()


  // MARK: - Initialization

  public init(renderingOptions: RenderingOptions) {
    self.pixelBuffer = Buffer(width: renderingOptions.width, height: renderingOptions.height)
    self.camera = renderingOptions.camera
    self.callbackQueue = renderingOptions.callbackQueue
    self.renderingOptions = renderingOptions

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

    renderingOptions.renderStatistics?.startRendering()

    for row in 0 ..< height {
      for column in 0 ..< width {
        renderingOptions.renderStatistics?.incrementPixelCounter()

        renderQueue.async(group: renderGroup) {
          let pixelValue = self.traceRayFor(x: column, y: row)

          self.writeQueue.async(group: self.renderGroup) {
            self.pixelBuffer[(row, column)] = pixelValue
          }
        }
      }
    }

    renderingOptions.renderStatistics?.completeRendering()

    renderGroup.notify(queue: callbackQueue) {
      let image = Image.image(from: self.pixelBuffer.pixelData, width: self.width, height: self.height)
      sceneCompletion(image)
    }
  }


  // MARK: - Private Functions

  @inline(__always) private func traceRayFor(x: Int, y: Int) -> PixelData {
    guard renderingOptions.sampleAdditionalPoints else {
      let ray = camera.castRayAt(x: Float(x), y: Float(y))
      let color = renderer.trace(ray: ray, depth: 0)

      return color
    }

    let points = renderingOptions.sampler.generateSampleBundle(at: Point2D(Float(x), Float(y)))
    var sampleCollection = SampleColorCollection()

    for point in points {
      let ray = camera.castRayAt(x: point.x, y: point.y)
      let color = renderer.trace(ray: ray, depth: 0)

      sampleCollection.collect(color: color)
    }

    return sampleCollection.averagePixelValue()
  }
}
