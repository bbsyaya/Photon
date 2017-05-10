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
import Cocoa
import XCTest
import Photon
import simd

final class PlaneTests: XCTestCase {

  func testInitialization() {
    let plane = Plane(point: Point3D(1, 2, 3), normal: Normal(0, 1, 0), material: Material.blueMaterial)
    XCTAssertEqual(plane.point, Point3D(1, 2, 3))
    XCTAssertEqual(plane.normal, Normal(0, 1, 0))
  }

  func testPointTesting() {
    let plane = Plane(point: Point3D.zero, normal: Normal(0, 1, 0), material: Material.blueMaterial)

    XCTAssertTrue(plane.contains(point: Point3D(30, 0, 20)))
    XCTAssertFalse(plane.contains(point: Point3D(30, 1, 20)))
  }

  func testNoIntersection() {
    let plane = Plane(point: Point3D.zero, normal: Normal(0, 1, 0), material: Material.blueMaterial)
    let ray = Ray(origin: Point3D(0, 1, 0), direction: Vector3D(0, 1, 0))
    let intersection = plane.intersection(with: ray)

    XCTAssertFalse(intersection.isHit)
  }

  func testValidIntersections() {
    do {
      let plane = Plane(point: Point3D.zero, normal: Normal(0, 1, 0), material: Material.blueMaterial)
      let ray = Ray(origin: Point3D(0, 5, 0), direction: Vector3D(0, -1, 0))
      let intersection = plane.intersection(with: ray)

      XCTAssertTrue(intersection.isHit)
      XCTAssertEqual(intersection.intersectionPoint, Point3D.zero)
      XCTAssertEqual(intersection.t, 5)
    }

    do {
      let plane = Plane(point: Point3D(0, 2, 0), normal: Normal(0, 1, 0), material: Material.blueMaterial)
      let ray = Ray(origin: Point3D(0, 5, 0), direction: Vector3D(0, -1, 0))
      let intersection = plane.intersection(with: ray)

      XCTAssertTrue(intersection.isHit)
      XCTAssertEqual(intersection.intersectionPoint, Point3D(0, 2, 0))
      XCTAssertEqual(intersection.t, 3)
    }

    do {
      let plane = Plane(point: Point3D(0, 10, 0), normal: Normal(0, -1, 0), material: Material.blueMaterial)
      let ray = Ray(origin: Point3D(0, -2, 0), direction: Vector3D(0, 1, 0))
      let intersection = plane.intersection(with: ray)

      XCTAssertTrue(intersection.isHit)
      XCTAssertEqual(intersection.intersectionPoint, Point3D(0, 10, 0))
      XCTAssertEqual(intersection.t, 12)
    }

    do {
      let plane = Plane(point: Point3D.zero, normal: Normal(0, 1, 0), material: Material.blueMaterial)
      let ray = Ray(origin: Point3D(0, 10, 0), direction: Vector3D(1.5, -1, -1))
      let intersection = plane.intersection(with: ray)

      XCTAssertTrue(intersection.isHit)
      XCTAssertEqual(intersection.intersectionPoint, Point3D(15, 0, -10))
      XCTAssertEqual(intersection.t, 10)
    }
  }

}
