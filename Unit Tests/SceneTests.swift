// ImageTests.swift
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
import Cocoa
import XCTest
import Photon

final class SceneTests: XCTestCase {

  func testInitialization() {
    let scene = Scene(renderingOptions: RenderingOptions(width: 0, height: 0))
    XCTAssertEqual(scene.objects.count, 0)
  }

  func testRenderingWithoutObjects() {
    let scene = Scene(renderingOptions: RenderingOptions(width: 3, height: 3))
    let expectation = self.expectation(description: "A scene with no objects should not render an image")
    var image: NSImage? = nil

    scene.renderScene { returnedImage in
      image = returnedImage
      expectation.fulfill()
    }

    waitForExpectations(timeout: 1.0) { error in
      XCTAssertNil(image)
    }
  }

  func testRenderingWithOneObject() {
    let scene = Scene(renderingOptions: RenderingOptions(width: 3, height: 6))

    scene.add(object: Plane(point: Point3D.zero, normal: Normal(0, 0, -1), material: Material.blueMaterial))

    let expectation = self.expectation(description: "A scene with objects should render an image")
    var image: NSImage? = nil

    scene.renderScene { returnedImage in
      image = returnedImage
      expectation.fulfill()
    }

    waitForExpectations(timeout: 10.0) { error in
      XCTAssertNotNil(image)
      XCTAssertEqual(image?.size.width, 3)
      XCTAssertEqual(image?.size.height, 6)
    }
  }

  func testDisablingAdditionalSampling() {
    let sampler = MockSampler()

    var options = RenderingOptions(width: 1, height: 1)
    options.sampleAdditionalPoints = false
    options.sampler = sampler

    let scene = Scene(renderingOptions: options)
    scene.add(object: Plane(point: Point3D.zero, normal: Normal(0, 0, -1), material: Material.blueMaterial))

    let expectation = self.expectation(description: "A scene with objects should render an image")

    scene.renderScene { returnedImage in
      expectation.fulfill()
    }

    waitForExpectations(timeout: 1.0) { error in
      XCTAssertFalse(sampler.hadSamplesRequested)
    }
  }

  func testEnablingAdditionalSampling() {
    let sampler = MockSampler()

    var options = RenderingOptions(width: 1, height: 1)
    options.sampleAdditionalPoints = true
    options.sampler = sampler

    let scene = Scene(renderingOptions: options)
    scene.add(object: Plane(point: Point3D.zero, normal: Normal(0, 0, -1), material: Material.blueMaterial))

    let expectation = self.expectation(description: "A scene with objects should render an image")

    scene.renderScene { returnedImage in
      expectation.fulfill()
    }

    waitForExpectations(timeout: 1.0) { error in
      XCTAssertTrue(sampler.hadSamplesRequested)
    }
  }

}
