// PlaneTests.swift
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
import XCTest

final class PlaneTests: XCTestCase {

  func testInitialization() {
    let plane = Plane(point: Point3D(1, 2, 3), normal: Normal(0, 1, 0))
    XCTAssertEqual(plane.point, Point3D(1, 2, 3))
    XCTAssertEqual(plane.normal, Normal(0, 1, 0))
  }

  func testPointTesting() {
    let plane = Plane(point: Point3D.zero, normal: Normal(0, 1, 0))

    XCTAssertTrue(plane.contains(point: Point3D(30, 0, 20)))
    XCTAssertFalse(plane.contains(point: Point3D(30, 1, 20)))
  }

  func testMissedIntersections() {
    let plane = Plane(point: Point3D.zero, normal: Normal(0, 1, 0))
    let ray = Ray(origin: Point3D(0, 1, 0), direction: Vector3D(0, 1, 0), time: 100)
    let hit = plane.intersected(by: ray)

    XCTAssertFalse(hit)
  }

}
