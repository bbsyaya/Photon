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

  func testVector2DInitialization() {
    let vector: Vector2D<Float> = Vector2D(x: 1.0, y: 2.0)

    XCTAssertEqual(vector.x, 1.0)
    XCTAssertEqual(vector.y, 2.0)
  }

}


// MARK: - Vector3D

final class Vector3DTests: XCTestCase {

  func testVector2DInitialization() {
    let vector: Vector3D<Float> = Vector3D(x: 1.0, y: 2.0, z: 3.0)

    XCTAssertEqual(vector.x, 1.0)
    XCTAssertEqual(vector.y, 2.0)
    XCTAssertEqual(vector.z, 3.0)
  }
  
}
