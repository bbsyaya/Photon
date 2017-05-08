// SampleColorCollectionTests.swift
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

final class SampleColorCollectionTests: XCTestCase {

  func testInitialization() {
    let collection = SampleColorCollection()

    XCTAssertEqual(collection.r, 0)
    XCTAssertEqual(collection.g, 0)
    XCTAssertEqual(collection.b, 0)
    XCTAssertEqual(collection.samplesCollected, 0)
  }

  func testSingleColorAdditions() {
    var collection = SampleColorCollection()
    let color = PixelData(r: 10, g: 20, b: 30)

    collection.collect(color: color)

    XCTAssertEqual(collection.r, 10)
    XCTAssertEqual(collection.g, 20)
    XCTAssertEqual(collection.b, 30)
    XCTAssertEqual(collection.samplesCollected, 1)
    XCTAssertEqual(collection.averagePixelValue(), color)
  }

  func testMultipleColorAdditions() {
    var collection = SampleColorCollection()
    let color = PixelData(r: 10, g: 20, b: 30)

    collection.collect(color: color)
    collection.collect(color: color)
    collection.collect(color: color)

    XCTAssertEqual(collection.r, 10 * 3)
    XCTAssertEqual(collection.g, 20 * 3)
    XCTAssertEqual(collection.b, 30 * 3)
    XCTAssertEqual(collection.samplesCollected, 3)
    XCTAssertEqual(collection.averagePixelValue(), color)
  }

}
