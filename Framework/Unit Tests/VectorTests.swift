// VectorTests.swift
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


// MARK: - Vector2D

final class Vector2DTests: XCTestCase {

  func testInitialization() {
    let vector = Vector2D(1.0, 2.0)

    XCTAssertEqual(vector.x, 1.0)
    XCTAssertEqual(vector.y, 2.0)
  }

  func testVectorAddition() {
    let v1 = Vector2D(1.0, 2.0)
    let v2 = Vector2D(3.0, 4.0)

    XCTAssertEqual(v1 + v2, Vector2D(4.0, 6.0))
  }

  func testVectorSubtraction() {
    let v1 = Vector2D(10.0, 5.0)
    let v2 = Vector2D(5.0, 5.0)

    XCTAssertEqual(v1 - v2, Vector2D(5.0, 0))
  }

  func testVectorMultiplication() {
    let v1 = Vector2D(1.0, 2.0)
    let v2 = Vector2D(1.0, 3.0)

    XCTAssertEqual(v1 * v2, Vector2D(1.0, 6.0))
  }

  func testVectorDivision() {
    let v1 = Vector2D(1.0, 3.0)
    let v2 = Vector2D(1.0, 2.0)

    XCTAssertEqual(v1 / v2, Vector2D(1.0, 1.5))
  }

  func testScalarAddition() {
    let vector = Vector2D(1.0, 2.0)

    XCTAssertEqual(vector + 3, Vector2D(4.0, 5.0))
  }

  func testScalarSubtraction() {
    let vector = Vector2D(1.0, 2.0)

    XCTAssertEqual(vector - 1, Vector2D(0, 1.0))
  }

  func testScalarMultiplication() {
    let vector = Vector2D(1.0, 2.0)

    XCTAssertEqual(vector * 3, Vector2D(3.0, 6.0))
  }

  func testScalarDivision() {
    let vector = Vector2D(1.0, 2.0)

    XCTAssertEqual(vector / 2, Vector2D(0.5, 1.0))
  }

}


// MARK: - Vector3D

final class Vector3DTests: XCTestCase {

  func testInitialization() {
    let vector = Vector3D(1.0, 2.0, 3.0)

    XCTAssertEqual(vector.x, 1.0)
    XCTAssertEqual(vector.y, 2.0)
    XCTAssertEqual(vector.z, 3.0)
  }

  func testVectorAddition() {
    let v1 = Vector3D(1.0, 2.0, 3.0)
    let v2 = Vector3D(4.0, 5.0, 6.0)

    XCTAssertEqual(v1 + v2, Vector3D(5.0, 7.0, 9.0))
  }

  func testVectorSubtraction() {
    let v1 = Vector3D(10.0, 11.0, 12.0)
    let v2 = Vector3D(5.0, 6.0, 7.0)

    XCTAssertEqual(v1 - v2, Vector3D(5.0, 5.0, 5.0))
  }

  func testVectorMultiplication() {
    let v1 = Vector3D(1.0, 2.0, 3.0)
    let v2 = Vector3D(1.0, 3.0, 0.0)

    XCTAssertEqual(v1 * v2, Vector3D(1.0, 6.0, 0.0))
  }

  func testVectorDivision() {
    let v1 = Vector3D(1.0, 3.0, 10.0)
    let v2 = Vector3D(1.0, 2.0, 5.0)

    XCTAssertEqual(v1 / v2, Vector3D(1.0, 1.5, 2.0))
  }

  func testScalarAddition() {
    let vector = Vector3D(1.0, 2.0, 3.0)

    XCTAssertEqual(vector + 3, Vector3D(4.0, 5.0, 6.0))
  }

  func testScalarSubtraction() {
    let vector = Vector3D(1.0, 2.0, 3.0)

    XCTAssertEqual(vector - 1, Vector3D(0, 1.0, 2.0))
  }

  func testScalarMultiplication() {
    let vector = Vector3D(1.0, 2.0, 3.0)

    XCTAssertEqual(vector * 3, Vector3D(3.0, 6.0, 9.0))
  }

  func testScalarDivision() {
    let vector = Vector3D(1.0, 2.0, 3.0)

    XCTAssertEqual(vector / 2, Vector3D(0.5, 1.0, 1.5))
  }
  
}
