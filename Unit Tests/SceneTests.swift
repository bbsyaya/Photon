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

final class SceneTests: XCTestCase {

  func testInitialization() {
    let scene = Scene(width: 0, height: 0, camera: OrthographicCamera())
    XCTAssertEqual(scene.objects.count, 0)
  }

  func testRenderingWithoutObjects() {
    let scene = Scene(width: 3, height: 3, camera: OrthographicCamera())
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
    let scene = Scene(width: 3, height: 6, camera: OrthographicCamera())

    scene.add(object: Plane(point: Point3D.zero, normal: Normal(0, 0, -1)))

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

  func testIntegratorUsage() {
    let pixelValue: UInt8 = 33
    let integrator = MockIntegrator(pixelValue: pixelValue)
    let scene = Scene(width: 10, height: 10, camera: OrthographicCamera(), integrator: integrator)
    let expectation = self.expectation(description: "A scene should call its integrator to trace rays")

    scene.add(object: Plane(point: Point3D.zero, normal: Normal(0, 0, -1)))

    scene.renderScene { returnedImage in
      let data = returnedImage!.tiffRepresentation!
      XCTAssertEqual(data[16], pixelValue)
      
      expectation.fulfill()
    }

    waitForExpectations(timeout: 10.0) { error in
      XCTAssertEqual(integrator.traceCount, 100)
    }
  }

}
