// SphereTests.swift
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

final class SphereTests: XCTestCase {

  func testInitialization() {
    let sphere = Sphere(center: Point3D(1, 2, 3), radius: 10)
    XCTAssertEqual(sphere.center, Point3D(1, 2, 3))
    XCTAssertEqual(sphere.radius, 10)
  }

  func testNoIntersection() {
    let sphere = Sphere(center: Point3D.zero, radius: 10)
    let ray = Ray(origin: Point3D(0, 11, 0), direction: Vector3D(0, 1, 0))
    let intersection = sphere.intersection(with: ray)

    XCTAssertFalse(intersection.isHit)
  }

  func testValidIntersections() {
    do {
      let sphere = Sphere(center: Point3D.zero, radius: 5)
      let ray = Ray(origin: Point3D(0, 10, 0), direction: Vector3D(0, -1, 0))
      let intersection = sphere.intersection(with: ray)

      XCTAssertTrue(intersection.isHit)
      XCTAssertEqual(intersection.intersectionPoint, Point3D(0, 5, 0))
      XCTAssertEqual(intersection.t, 5)
    }

    do {
      let sphere = Sphere(center: Point3D.zero, radius: 5)
      let ray = Ray(origin: Point3D(2.5, 10, 0), direction: Vector3D(0, -1, 0))
      let intersection = sphere.intersection(with: ray)

      XCTAssertTrue(intersection.isHit)
      XCTAssert(intersection.intersectionPoint.y > 3 && intersection.intersectionPoint.y < 5)
      XCTAssertEqual(intersection.intersectionPoint.x, 2.5)
    }
  }

}
